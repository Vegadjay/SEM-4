// check pass or fail

import "dart:io";

void checkPass(int hindiMark, int englishMark, int mathsMark, int flutterMark, int yogaMark) {
  int sum = hindiMark + englishMark + mathsMark + flutterMark + yogaMark;
  double total = (sum * 100) / 500;

  if(total < 35) {
    stdout.write("YOU ARE FAIL......................");
  }
  else if(total >= 35 && total <= 45 ) {
    stdout.write("Pass Class");
  }
  else if(total >= 45 && total <= 60) {
    stdout.write("Second Class");
  }
  else if (total >= 60 && total <=70) {
    stdout.write("First Class");
  }
  else {
    stdout.write("Distinction..... ");
  }
}

void main() {
  checkPass(50, 70, 30, 70, 10);
}