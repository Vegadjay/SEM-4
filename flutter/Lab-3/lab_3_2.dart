// WAP to find factorial of the given number

import 'dart:io';

void findFac(int number) {
  int fac = 1;
  for(int i = 1; i <= number; i++) {
    fac = fac * i;
  }
  print("Here is Fac Value: $fac");
}

void main() {
  findFac(5);
}