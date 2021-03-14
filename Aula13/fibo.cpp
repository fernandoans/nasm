#include <iostream>

using namespace std;

extern "C" long Fibonacci(long a);
//         rax            rdi

//    1  2  3  4  5 elemento
// 1, 1, 2, 3, 5, 8
int main()
{
    cout << "Foi retornado: " << Fibonacci(6) << endl;
    return 0;
}