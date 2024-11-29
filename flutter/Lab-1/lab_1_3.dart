import 'dart:io';

void main() {
  int? far;

  stdout.write("Enter Farenhit: ");
  far = int.parse(stdin.readLineSync()!);

  double cel = (far - 32) * (5 / 9);
  
  stdout.write("Here is your cel $cel");
}