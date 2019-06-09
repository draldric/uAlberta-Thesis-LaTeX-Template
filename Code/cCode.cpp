#include <iostream>
using namespace std;
/* This function adds two integer values
 * and returns the result
 */int
sum(int num1, int num2){
   int num3 = num1 + num2; return num3;
}

int main(){
   //Calling the function
   cout << 'The sum is:' << sum(1,99);
   return 0;
}