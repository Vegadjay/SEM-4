// WAP that prompts the user to enter 5 numbers, stores them in a List, and displays them in
// increasing order.

import 'dart:io';

void main() {
  List<int>? marks = [];
  int i = 0;
  stdout.write("Enter Numbers: ");
  while(i != 5) {
    marks.add(int.parse(stdin.readLineSync()!));
    i++;
  }
  marks.sort();
  stdout.write(marks);
}
