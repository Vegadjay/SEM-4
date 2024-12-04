// WAP program to calculate the sum of all positive even numbers and the sum of all negative
// odd numbers from a set of numbers. you can enter 0 (zero) to quit the program and thus it
// displays the result.

import 'dart:io';

void main() {
  int a = 1;
  int? number;
  int posSum = 0;
  int negSum = 0;
  print('Enter Trial Number:  ');
  number = int.parse(stdin.readLineSync()!);
  while(number != 0) {
    stdout.write('Enter Number: ');
    number = int.parse(stdin.readLineSync()!);
    if(number > 0 && number % 2 == 0) {
      posSum = posSum + number;
    }
    else if(number < 0 && number % 2 != 0) {
      negSum = negSum + number;
    }
  }

  print("Pos Sum is: $posSum and Neg sum is $negSum ");
}