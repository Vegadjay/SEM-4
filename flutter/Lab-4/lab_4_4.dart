// WAP to accept a number and check whether the number is prime or not. Use method name
// check (int n). The method returns 1, if the number is prime otherwise, it returns 0.

import 'dart:io';

int check(int n) {
  int flag = 0;

  if(n == 0 && n == 1) {
    return 0;
  }

  else {
      for(int i = 2; i <= n; i++) {
        if( n % i == 0) {
          flag = 1;
        }
      }
  }
  if(flag == 1) {
    return 1;
  }
  return 0;
}

void main() {
  int checkPrime = check(20);
  if(checkPrime == 1) {
    print("Number is Prime... ");
  }
  else {
    print("Number is not prime");
  }
}