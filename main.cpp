#include "main.h"
#include <mutex>

const int MAX_PACKET_SIZE = 65536;
const in_port_t ECHO_PORT =  htons(50123);
const in_port_t SYNC_PORT = htons(1235);
int empty_socket;
int udp_in_socket;
pthread_t dumper_thread;
pthread_t echo_thread;
pthread_t sync_thread;

std::mutex map_lock;

std::map<string,std::set<custom_icmp>> data;
std::set<custom_icmp> data_set;

vector<sockaddr_in*> broadcasts_addrs;
vector<sockaddr_in*> interfaces_ips;

void put(custom_icmp packet){
    map_lock.lock();
    data[packet.source_addr].insert(packet);
    data_set.insert(packet);
    map_lock.unlock();
}

void console (){
    string input;
    while(true){
        cout<<"dumper#";
        getline(cin,input);
        if(input=="exit"){
            break;
        }else{
            vector<string> cmd = parseCommand(input);
            if(cmd.size()>0){
                runCommand(cmd);
            }
        }
    }
}

vector<string> parseCommand(string input){
    vector<string> parsed;
    size_t l = input.length();
    size_t i=0;
    while(i<l){
        string cmd=getNextComand(input,i);
        parsed.push_back(cmd);
    }
    return parsed;
}

string getNextComand (string& s,size_t& i){
    size_t l = s.length();
    while((s[i]==' ' || s[i]=='\t') && i<l)++i;//skip spaces before
    string buffer="";
    while(s[i]!=' ' && s[i]!='\t' && i<l){//stop on next space
        buffer+=s[i];
        ++i;
    }
    return buffer;
}

bool validate_comand (vector<string>& cmd,string comand){
    return cmd[0]==comand;
}

void runCommand (vector<string>& cmd){
    if (validate_comand(cmd,"usage"))
    {
        print_usage();
    }
    else if (validate_comand(cmd,"get"))
    {
        get(cmd);
    }
    else if (validate_comand(cmd,"echo"))
    {
        echo();
    }
    else{
        cerr<<"unkown command\n"<<std::endl;
        print_usage();
    }
}

void echo (){
    send_sync_broadcast((sockaddr_in*)broadcasts_addrs[0]);
}

void print_usage(){
    cout<<"Usage : [usage/get host_addr/echo"<<std::endl;
}

int main()
{
    init();
    console();
    pthread_cancel(dumper_thread);
    pthread_cancel(echo_thread);
    pthread_cancel(sync_thread);
}

void process_packet(unsigned char* buffer , int Size)
{
    custom_icmp packet (buffer,Size);
    put(packet);
}

void * dumper (void* arg){
    sockaddr empty_addr;
    socklen_t size_of_epmty_addr = sizeof empty_addr;
    unsigned char *input_buffer = (unsigned char *)malloc(MAX_PACKET_SIZE);
    empty_socket = socket(AF_INET , SOCK_RAW , IPPROTO_ICMP);
    if(empty_socket < 0)
    {
        cerr<<("\ndumper socket error\n");
        exit(1);
    }
    while(1)
    {
        int resived_length = recvfrom(empty_socket , input_buffer , MAX_PACKET_SIZE , 0 , &empty_addr ,  &size_of_epmty_addr);
        if(resived_length <0 )
        {
            cerr<<"\nrecived empty packet\n";
            exit(1);
        }
        process_packet(input_buffer , resived_length);
    }
    close(empty_socket);
    cout<<"\ndumper finished\n"<<std::endl;
}


void process_echo(unsigned char* buffer){
    iphdr* ip_header = (iphdr *)buffer;
    unsigned short ip_header_length = ip_header->ihl*4;//length in bytes
    udphdr* udp_header = (udphdr*)(buffer+ip_header_length);
    if(udp_header->dest!=ECHO_PORT){
        return;
    }
    sockaddr_in saddr,daddr;
    saddr.sin_addr.s_addr = ip_header->saddr;
    if(in_interfaces(&saddr)){
        return;
    }
    daddr.sin_addr.s_addr = ip_header->daddr;

    if(in_broadcasts(&daddr)){
        send_sync_request(&saddr);
    }

    string source,dest;
    source = (string) inet_ntoa(saddr.sin_addr);
    dest = (string)  inet_ntoa(daddr.sin_addr);
    cout<<"\n udp recieved from "<<source<<" to "<<dest<<"\n";
    send_all_data(&saddr);


}

void * echo_listener (void* arg){
    sockaddr empty_addr;
    socklen_t size_of_epmty_addr = sizeof empty_addr;
    unsigned char *input_buffer = (unsigned char *)malloc(MAX_PACKET_SIZE);

    udp_in_socket = socket(AF_INET ,SOCK_RAW, IPPROTO_UDP);
    if(udp_in_socket < 0)
    {
        cerr<<("\necho udp socket error\n");
        exit(1);
    }

    sockaddr_in in_addr;
    in_addr.sin_family=AF_INET;
    in_addr.sin_addr.s_addr=INADDR_ANY;
    in_addr.sin_port=ECHO_PORT;
    if ( bind(udp_in_socket, (sockaddr*)&in_addr, sizeof in_addr) == -1 ) {
        close(udp_in_socket);
        cerr<<"cant open socket\n";
    }

    while(1)
    {
        int resived_length = recvfrom(udp_in_socket , input_buffer , MAX_PACKET_SIZE , 0 ,0 ,0);
        if(resived_length <0 )
        {
            cerr<<"\nrecived empty packet\n";
            exit(1);
        }
        process_echo(input_buffer);
    }
    close(empty_socket);
    cout<<"\ndumper finished\n"<<std::endl;
}

void * data_listener (void* arg);

void print_addrs(vector<sockaddr_in*> &addrs){
    cout<<"\n";
    for(vector<sockaddr_in*>::iterator it= addrs.begin();it!=addrs.end();it++){
        sockaddr_in* broadcast = *it;
        cout<<inet_ntoa(broadcast->sin_addr)<<" ";
    }
    cout<<"\n";
}
void init(){
    init_addrs();
    cout<<"\ninterfaces";
    print_addrs(interfaces_ips);
    cout<<"\nbroadcast ips";
    print_addrs(broadcasts_addrs);
    pthread_create(&dumper_thread,NULL,dumper,0);
    pthread_create(&echo_thread,NULL,echo_listener,0);
    pthread_create(&sync_thread,NULL,data_listener,0);
}

void get (string host){
    cout<<"packets for "<<host;
    map_lock.lock();
    set<custom_icmp> packets = data[host];
    map_lock.unlock();
    for(set<custom_icmp>::iterator it = packets.begin();it!=packets.end();it++){
        custom_icmp packet = *it;
        packet.print();
    }
}

void get(vector<std::string> &cmd)
{
    if(cmd.size()<2){
        cerr<< "\n empty host\n";
        return;
    }
    get (cmd[1]);
}

void init_addrs()
{
    ifaddrs *interfaces, *interface;
    if (getifaddrs(&interfaces) == -1) {
        cerr<<"\ncant read interfaces\n";
        exit(1);
    }
    for(interface = interfaces;interface!=NULL;interface = interface->ifa_next){
        if(interface->ifa_addr->sa_family == AF_INET){//checking only internet interfaces
            sockaddr_in* addr = (sockaddr_in*)interface->ifa_addr;
            sockaddr_in* broadcast_addr = (sockaddr_in*)interface->ifa_broadaddr;
            interfaces_ips.push_back(addr);
            if((string)inet_ntoa(addr->sin_addr)!=(string)inet_ntoa(broadcast_addr->sin_addr)){
                broadcasts_addrs.push_back(broadcast_addr);
            }
        }
    }
}


void send_sync_broadcast(sockaddr_in* broad_cast_addr)
{
    sockaddr_in with_port = *broad_cast_addr;
    with_port.sin_port=ECHO_PORT;
    int broad_cast_sock = socket(AF_INET,SOCK_DGRAM,0);
    if(broad_cast_sock==-1){
        cerr<<"failed on create socket for broadcast";
    }
    int broad_cast_yes = 1;
    int message = 1;
    if(setsockopt(broad_cast_sock,SOL_SOCKET,SO_BROADCAST,&broad_cast_yes,sizeof broad_cast_yes)==-1){
        cerr<<"socket opt failed";
    }
    sockaddr_in client_addr;
    client_addr.sin_family = AF_INET;
    client_addr.sin_addr.s_addr = INADDR_ANY;
    if ( bind(broad_cast_sock, (sockaddr*)&client_addr, sizeof(client_addr)) == -1 ) {
        close(broad_cast_sock);
        printf("cant open socket\n");
    }

    if(sendto(broad_cast_sock,&message,sizeof message,0,(sockaddr*)&with_port,sizeof with_port)==-1){
        cerr<<"failed to send broadcast";
    }
    close(broad_cast_sock);
}

void send_sync_request(sockaddr_in* addr)
{
    sockaddr_in with_port = *addr;
    with_port.sin_port=ECHO_PORT;
    int sync_sock = socket(AF_INET,SOCK_DGRAM,0);
    if(sync_sock==-1){
        cerr<<"failed on create socket for broadcast";
    }
    int message = 1;
    sockaddr_in client_addr;
    client_addr.sin_family = AF_INET;
    client_addr.sin_addr.s_addr = INADDR_ANY;
    if ( bind(sync_sock, (sockaddr*)&client_addr, sizeof(client_addr)) == -1 ) {
        close(sync_sock);
        printf("cant open socket\n");
    }

    if(sendto(sync_sock,&message,sizeof message,0,(sockaddr*)&with_port,sizeof with_port)==-1){
        cerr<<"failed to response echo";
    }
    close(sync_sock);
}

bool in_interfaces(sockaddr_in *addr)
{
    for(vector<sockaddr_in*>::iterator it= interfaces_ips.begin();it!=interfaces_ips.end();it++){
        sockaddr_in* interface = *it;
        if(addr_compare(addr,interface)){
            return true;
        }
    }
    return false;
}


bool in_broadcasts(sockaddr_in *addr)
{
    for(vector<sockaddr_in*>::iterator it= broadcasts_addrs.begin();it!=broadcasts_addrs.end();it++){
        sockaddr_in* interface = *it;
        if(addr_compare(addr,interface)){
            return true;
        }
    }
    return false;
}

void send_all_data(sockaddr_in *addr)
{
    cout<<"sending data to"<<inet_ntoa(addr->sin_addr)<<"\n";
    int sock = socket(AF_INET,SOCK_STREAM,0);
    if(sock==-1){
        cerr<<"cant create socket for sending data";
    }

    sockaddr_in with_port = *addr;
    with_port.sin_port = SYNC_PORT;

    if(connect(sock,(sockaddr*) addr, sizeof addr)==-1){
        cerr<<"failed to connect for data send";
    }

    map_lock.lock();
    set<custom_icmp> copy = data_set;
    map_lock.unlock();

    unsigned int total_packets = copy.size();
    send(sock,&total_packets,sizeof total_packets,0);

    for(set<custom_icmp>::iterator it = copy.begin();it!=copy.end();it++){
        custom_icmp packet = *it;
        send(sock,&packet.raw_data_length,sizeof packet.raw_data_length,0);
        send(sock,packet.raw_data,packet.raw_data_length,0);
    }
    cout<<"succeed send\n";
}

void * data_listener (void* arg){
    sockaddr empty_addr;
    socklen_t size_of_epmty_addr = sizeof empty_addr;
    unsigned char *input_buffer = (unsigned char *)malloc(MAX_PACKET_SIZE);

    int server_sock = socket(AF_INET ,SOCK_STREAM, 0);
    if(server_sock < 0)
    {
        cerr<<("\ndata listener socket error\n");
        exit(1);
    }

    sockaddr_in in_addr;
    in_addr.sin_family=AF_INET;
    in_addr.sin_addr.s_addr=INADDR_ANY;
    in_addr.sin_port=SYNC_PORT;
    if ( bind(server_sock, (sockaddr*)&in_addr, sizeof in_addr) == -1 ) {
        close(server_sock);
        cerr<<"cant open socket\n";
    }

    listen(server_sock,10);
    while(1)
    {
        int sock = accept(server_sock,&empty_addr,&size_of_epmty_addr);
        if(sock==-1){
            cerr<<"can't create socket on data recieve";
            exit(1);
        }
        int resived_length = recv(sock, input_buffer, 4, 0);
        if(resived_length <4 )
        {
            cerr<<"\nrecived packet less then 4\n";
            exit(1);
        }

        unsigned int total_packs = *((unsigned int*) input_buffer);

        for(unsigned int i=0;i<total_packs;++i){
            resived_length = recv(sock, input_buffer, 4, 0);
            if(resived_length <4 )
            {
                cerr<<"\nrecived packet less then 4\n";
                exit(1);
            }
            unsigned int packet_length = *((unsigned int*) input_buffer);

            resived_length = recv(sock, input_buffer, packet_length, 0);
            if(resived_length <4 )
            {
                cerr<<"\nrecived empty packet\n";
                exit(1);
            }
            process_packet(input_buffer,resived_length);
        }
        close(sock);
    }
    close(empty_socket);
    close(server_sock);
    cout<<"\ndata listener finished\n"<<std::endl;
}

