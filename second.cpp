#include <iostream>
#include <string>

int main(int argc, char* argv[]){
    std::string hello = "Hello world\n";
    hello += "\tMati this is mati\n";
    std::cout << hello;
    std::string name;
    std::cout << "type your name next!\n";
    std::getline(std::cin,name);
    std::cout << "\nyou typed " << name << "\n";
    std::cout << name.c_str();
    return 0;
}