import 'dart:io';

void main() {
  int? hindi,english,maths,cs,yoga;

  stdout.write("Enter Hindi Marks: ");
  hindi = int.parse(stdin.readLineSync()!);

  stdout.write("Enter English Marks: ");
  english = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Maths Marks: ");
  maths = int.parse(stdin.readLineSync()!);

  stdout.write("Enter cs Marks: ");
  cs = int.parse(stdin.readLineSync()!);

  stdout.write("Enter yoga Marks: ");
  yoga = int.parse(stdin.readLineSync()!);
  int sum = hindi + maths + english + yoga + cs;
  double total = (sum * 100) / 500;

  stdout.write("Here is Percentage of your sem: $total");
}