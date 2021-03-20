#include <iostream>

using namespace std;

//         eax        edi         esi
extern "C" int Teste1(int valor1, int valor2);
extern "C" int Teste2(int valor1);

int main()
{
    cout << "Do teste1 foi retornado: " << Teste1(30, 20) << endl;
    cout << "Do teste2 foi retornado: " << Teste2(3) << endl;
    return 0;
}