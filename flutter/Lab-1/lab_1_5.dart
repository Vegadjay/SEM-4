// read number in meter, and convert into feet

import 'dart:io';

void main() {
  int? meter;
  stdout.write("Enter meter value: ");
  meter = int.parse(stdin.readLineSync()!);

  double feet = meter * 3.28084;

  stdout.write("This is the feet amount: $feet");
}