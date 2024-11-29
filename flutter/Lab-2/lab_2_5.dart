// find out using conditional oprator

import 'dart:io';

void checkLarge(int number1, int number2,int number3) {
    if(number1 > number2 && number1 > number3) {
      stdout.write("$number1 is large... ");
    }
    else if(number2 > number3 && number2 > number1) {
      stdout.write("$number2 is large... ");
    }
    else {
      stdout.write("$number3 is large... ");
    }

}

void main() {
  checkLarge(-30, -40, -10);
}