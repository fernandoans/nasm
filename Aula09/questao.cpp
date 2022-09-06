#include <iostream>

using namespace std;

extern "C" int Question(int a);

int main()
{
    if (Question(27) == 1)
    {
        cout << "Número Par" << endl;
    }
    else
    {
        cout << "Número Ímpar" << endl;
    }
    return 0;
}