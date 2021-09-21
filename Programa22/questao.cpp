#include <iostream>

using namespace std;

extern "C" int Question(int a);

int main()
{
   if (Question(27) == 1)
   {
      cout << "Numero Par" << endl;
   }
   else
   {
      cout << "Numero Impar" << endl;
   }
   return 0;
}
