#include <iostream>

using namespace std;

extern "C" int PassarParam(int a, int b, int c);
//                         edi    esi    edx
//         eax

int main()
{
    cout << "Foi retornado:" << PassarParam(50, 40, 10) << endl;
    return 0;
}