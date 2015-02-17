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
void send_all_data (sockaddr_in* addr);

bool in_interfaces (sockaddr_in* addr);
bool in_broadcasts (sockaddr_in* addr);
bool addr_compare (sockaddr_in* left, sockaddr_in* right){
    return left->sin_addr.s_addr==right->sin_addr.s_addr;
}

struct custom_icmp {
    custom_icmp (unsigned char* buffer , int buffer_length){
        sockaddr_in saddr,daddr;
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

        type = (unsigned int)(icmp_header->type);
        code = (unsigned int)(icmp_header->code);
        checksum = (unsigned int) ntohs(icmp_header->checksum);

        data =(unsigned char *)malloc(data_length);
        unsigned char* data_begin = buffer+headers_length+1;
        strncpy((char*)data,(char*)data_begin,data_length);


        raw_data_length=buffer_length;
        raw_data = (unsigned char *)malloc(raw_data_length);
        strncpy((char*)raw_data,(char*)buffer,raw_data_length);
    }

    string source_addr;
    string dest_addr;
    unsigned int type;
    unsigned int code;
    u_int16_t checksum;
    unsigned int data_length;
    unsigned char* data;
    unsigned int raw_data_length;
    unsigned char* raw_data;
    void print(){
        cout<<"ICMP"<<"\n";
        cout<<"host_addr "<<source_addr<<"\n";
        cout<<"dest_addr "<<dest_addr<<"\n";
        cout<<"type "<<type<<"\n";
        cout<<"code "<<code<<"\n";
        cout<<"checksum "<<checksum<<"\n";
        cout<<"icmp data\n";
        for( unsigned int offset = 0;offset<data_length;offset++){
            cout<<data[offset];
        }
        cout<<std::endl;
    }

    bool operator<(const custom_icmp& other) const
    {
       return checksum < other.checksum;
    }
};

#endif // MAIN_H
