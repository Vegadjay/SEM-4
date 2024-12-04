// WAP to print reverse string.

import 'dart:io';

void reverseString(String str) {
  List<String>? newString = str.split('');
  int length = newString.length;
  for(int i = length - 1 ; i >= 0; i--) {
    stdout.write("${newString[i]}");
  }
}

void main() {
  reverseString("Darshan");
}