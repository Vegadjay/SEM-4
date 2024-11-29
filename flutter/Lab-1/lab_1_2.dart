import 'dart:io';

void main() {
  int? a;
  int? b;

  stdout.write("Enter First Number:  ");
  a = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Second NUmber:  ");
  b = int.parse(stdin.readLineSync()!);

  int? c = a + b;
  stdout.write("Here Is Your Ans: $c");
}