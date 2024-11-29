// make one calculator using if else if else

import "dart:io";

void main() {
  int? num1;
  int? num2;
  String? sign;
  stdout.write("Enter first Number: ");
  num1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter second Number: ");
  num2 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Sign : ");
  sign = stdin.readLineSync();


  switch(sign) {
    case "+":
      stdout.write("Here is your sum value: ${num1 + num2} ");
      break;
    case "-":
    stdout.write("Here is your sum value: ${num1 - num2} ");
    break;

    case "*":
    stdout.write("Here is your sum value: ${num1 * num2} ");
    break;

    case "/":
    stdout.write("Here is your sum value: ${num1 / num2} ");
    break;

    default:
      stdout.write("Enter Valid Sign------");
  }

}