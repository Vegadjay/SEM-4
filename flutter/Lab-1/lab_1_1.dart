import "dart:io";

void main() {
  String? a;
  stdout.write("Enter Your Name: ");
  a = stdin.readLineSync();
  stdout.write("Hello, Welcome $a");
}