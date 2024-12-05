// WAP to find maximum number from given two numbers using method.

import 'dart:io';
int findMax(int number1, int number2) {
  if(number1 > number2){
      return number1;
  }
  else {
    return number2;
  }
}

void main() {
  int? number1;
  stdout.write("Enter Number1");
  number1 = int.parse(stdin.readLineSync()!);
  int? number2;
  stdout.write("Enter Number2");
  number2 = int.parse(stdin.readLineSync()!);
  print(findMax(number1, number2));
}