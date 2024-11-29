import "dart:io";

void checkLargestNumber (int number1, int number2, int number3) {
  if(number1 > number2) {
    if(number1 > number3) {
      stdout.write("$number1 is greater-- ");
    }
  }
  else if(number2 > number3){
    if(number2 > number1) {
      stdout.write("$number2 is greater-- ");
    }
  }
  else {
    stdout.write("$number3 is greater-- ");
  }
}

void main() {
  checkLargestNumber(70, 100, 200);
}