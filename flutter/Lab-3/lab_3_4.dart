// WAP to print given number in reverse order

import 'dart:io';
void reverseNumber(int number) {
  int revNum = 0;
  while( number != 0) {
    revNum = revNum * 10 + number % 10;
    number = (number / 10).toInt();
  }
  print("$revNum");
}

void main() {
  int? number;
  print("Enter Number:  ");
  number = int.parse(stdin.readLineSync()!);

  reverseNumber(number);
}