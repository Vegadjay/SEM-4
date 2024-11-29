// given number is positive or not

import 'dart:io';

void main() {
  int? a;
  stdout.write("Enter Number: ");
  a = int.parse(stdin.readLineSync()!);
  stdout.write(a > 0 ? "$a Is positive Number" : "$a Is nagative Number");
}