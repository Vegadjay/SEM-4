import 'dart:io';

void main() {
  double? weight;
  double? height;

  stdout.write("Enter Weight in pound: ");
  weight = double.parse(stdin.readLineSync()!);
  double kgWeight = weight / 45359237;
  stdout.write("Enter Height in meters: ");
  height = double.parse(stdin.readLineSync()!);
  double meterHeight = height / 0.254;
  double bmi = kgWeight / meterHeight;

  
  stdout.write("Here is your bmi count $bmi");
}