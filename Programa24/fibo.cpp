#include <iostream>

using namespace std;

extern "C" long Fibonacci(long a);
//         eax            edi

//    1  2  3  4  5 elemento
// 1, 1, 2, 3, 5, 8
int main()
{
    cout << "O " << 8 << "º elemento da sequencia de Fibonacci é: " << Fibonacci(8) << endl;
    return 0;
}