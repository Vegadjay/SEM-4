// WAP to find whether the given number is prime or not.

import 'dart:io';

void checkPrime(int number) {
  int i,flag = 0;
  double m = number / 2;
  if(number == 0 || number == 1) {
    stdout.write("Number is not valid.... ");
  }
  else {
    for(int i = 2; i <= m; i++) {
      if(i % 2 == 0) {
        flag = 1;
      }
    }
  }
  if(flag == 0) {
    print("Number is prime");
  }
  else {
    print("Number is not prime");
  }
}

void main() {
  int? number;
  print("Enter Number: ");
  number = int.parse(stdin.readLineSync()!);

  checkPrime(number);
}