// WAP to print numbers between two given numbers which is divisible by 2 but not divisible by
// 3.
import 'dart:io';
void findNumber(int number1, int number2) {
  for(int i = number1; i <= number2 ; i++) {
    if( i % 2 == 0) {
      if(i % 3 != 0) {
        print("$i");
      }
    }
    else {
      continue;
    }
  }
}

void main() {
  int? number1;
  int? number2;
  print("Enter First Number: ");
  number1 = int.parse(stdin.readLineSync()!);
  print("Enter Second Number: ");
  number2 = int.parse(stdin.readLineSync()!);
  findNumber(number1!, number2!);
}