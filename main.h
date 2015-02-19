#ifndef MAIN_H
#define MAIN_H
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<netinet/ip_icmp.h>
#include<netinet/udp.h>
#include<netinet/ip.h>
#include<sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <pthread.h>
#include <ifaddrs.h>


#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <set>

#include <ctime>

using std::cout;
using std::cin;
using std::cerr;
using std::string;
using std::vector;
using std::map;
using std::set;

void init();
vector<string> parseCommand(string input);
string getNextComand (string& s,size_t& i);
bool validate_comand (vector<string>& cmd,string comand);
void runCommand (vector<string>& cmd);
void echo ();
void get(vector<string>& cmd);
void print_usage();
void init_addrs();
void send_sync_broadcast(sockaddr_in* broadcast_addr);
void send_sync_request(sockaddr_in* addr);
void send_all_data (sockaddr_in* addr,unsigned long time);

bool in_interfaces (sockaddr_in* addr);
bool in_broadcasts (sockaddr_in* addr);
bool addr_compare (sockaddr_in* left, sockaddr_in* right){
    return left->sin_addr.s_addr==right->sin_addr.s_addr;
}

unsigned long get_current_time();

struct custom_icmp {
    custom_icmp (unsigned char* buffer , int buffer_length,unsigned long recieved_time=0){
        this->recieved_time =recieved_time;
        sockaddr_in saddr;
        memset(&saddr, 0, sizeof(saddr));
        memset(&daddr, 0, sizeof(daddr));

        iphdr *ip_header = (iphdr *)buffer;
        unsigned short ip_header_length = ip_header->ihl*4;//length in bytes
        saddr.sin_addr.s_addr = ip_header->saddr;
        daddr.sin_addr.s_addr = ip_header->daddr;

        icmphdr *icmp_header = (icmphdr *)(buffer + ip_header_length);

        unsigned int headers_length = ip_header_length + sizeof icmp_header;
        data_length = buffer_length-headers_length;

        source_addr = (string) inet_ntoa(saddr.sin_addr);
        dest_addr = (string)  inet_ntoa(daddr.sin_addr);

        ip_id = (unsigned int)(ip_header->id);
        type = (unsigned int)(icmp_header->type);
        code = (unsigned int)(icmp_header->code);
        checksum = (unsigned int) ntohs(icmp_header->checksum);

        data =(unsigned char *)malloc(data_length);
        unsigned char* data_begin = buffer+headers_length+1;
        strncpy((char*)data,(char*)data_begin,data_length);


        raw_data_length=buffer_length;
        raw_data = (unsigned char *)malloc(raw_data_length);
        memcpy(raw_data,buffer,buffer_length);
        broadcasted = in_broadcasts(&daddr);
    }

    unsigned long recieved_time=0;
    string source_addr;
    string dest_addr;
    unsigned int ip_id;
    unsigned int type;
    unsigned int code;
    u_int16_t checksum;
    unsigned int data_length;
    unsigned char* data;
    uint16_t raw_data_length;
    unsigned char* raw_data;
    sockaddr_in daddr;
    bool broadcasted;
    void print(){
        cout<<"ICMP"<<"\n";
        cout<<"recieved at "<<recieved_time<<"\n";
        cout<<"host_addr "<<source_addr<<"\n";
        cout<<"dest_addr "<<dest_addr<<"\n";
        cout<<"ip id "<<ip_id<<"\n";
        cout<<"type "<<type<<"\n";
        cout<<"code "<<code<<"\n";
        cout<<"checksum "<<checksum<<"\n";
        cout<<"icmp data\n";
        for( unsigned int offset = 0;offset<data_length;offset++){
            cout<<data[offset];
        }
        cout<<std::endl;
    }
    void print_copy(){
       custom_icmp(raw_data,raw_data_length,recieved_time).print();
    }

    bool broad_cast_compare (const custom_icmp& other) const{
        if(source_addr<other.source_addr) return true;
        if(source_addr>other.source_addr) return false;

        if(ip_id< other.ip_id) return true;
        if(ip_id>other.ip_id) return false;

        if(checksum< other.checksum) return true;
        return false;
    }

    bool simple_compare (const custom_icmp& other) const {
        if(recieved_time< other.recieved_time) return true;
        if(recieved_time==other.recieved_time) return broad_cast_compare(other);
        return false;
    }

    bool operator<(const custom_icmp& other) const
    {
        if(broadcasted != other.broadcasted){
            return !broadcasted;
        }
       return other.broadcasted? broad_cast_compare(other): simple_compare(other);
    }


};

int infinite_send (int socket, const void *message, size_t length){
    size_t left = length;
    int tries = 200;
    while(left>0){
        int sended = send(socket,message+length-left,left,0);
        if(sended<0){
            return -1;
        }
        if(tries<0){
            errno = EINPROGRESS;
            return -1;
        }
        left-=sended;
        --tries;
    }
    return 0;
}

int infinite_recv (int socket,void *input_buffer, size_t length){
    size_t left = length;
    int tries = 200;
    while(left>0){
        int recieved = recv(socket,input_buffer+length-left,left,0);
        if(recieved<0){
            return -1;
        }
        if(tries<0){
            errno = EINPROGRESS;
            return -1;
        }
        left-=recieved;
        --tries;
    }
    return 0;
}





#endif // MAIN_H
