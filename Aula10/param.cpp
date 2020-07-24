#include <iostream>

using namespace std;

extern "C" int PassarParam(int a, int b);

int main() {
  cout<<"Foi retornado:"<<PassarParam(40, 50)<<endl;
  return 0;
}
