// WAP to calculate simple interest using method
import 'dart:io';
double calIntrest(double p, double t, double r) {
  double intrest = (p * t * r) / 100;
  return intrest;
}

void main() {
  double? principalValue,intrestRate,time;
  stdout.write("Enter Principal Value: ");
  principalValue = double.parse(stdin.readLineSync()!);
  stdout.write("Enter Time: ");
  time = double.parse(stdin.readLineSync()!);
  stdout.write("Enter Intrest Rate Value: ");
  intrestRate = double.parse(stdin.readLineSync()!);
  print(calIntrest(principalValue, intrestRate, time));
}