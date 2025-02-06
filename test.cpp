#include <iostream>

int main() {
    int arr[5] = {23,1,4,53,3};
    int x = 123;
    int* y = &x;
    std::cout << "mem adress of pointer y = " << y;
    std::cout << "\nval of dereferenced y = " << *y;
    int z = *y;
    z = z + 2;
    std::cout << "\nval of z + 2 = " << z << " and val of x and y are both " << x << " ," << *y;
    *y += 2;
    std::cout << "\nNew val of x and y are both " << x << " ," << *y;
    return 0; 
}