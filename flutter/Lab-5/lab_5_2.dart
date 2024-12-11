// WAP to read 2 list and remove that contains only the elements that are common between
// them

import 'dart:io';

void main() {
  print("Enter value with spaces and make sure do not add string and other numbers only add integers:... ");
  List<dynamic>? list1 = (stdin.readLineSync()!.split(' '));
  List<dynamic>? list2 = (stdin.readLineSync()!.split(' '));

  list2.removeWhere((element) => list1.contains(element));
  print(list2);
}