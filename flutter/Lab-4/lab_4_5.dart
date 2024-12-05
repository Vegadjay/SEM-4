// WAP to count number of even or odd number from an array of n numbers

void checkOddEven(var params) {
  int oddCount = 0;
  int evenCount = 0;
  print(params);
    for(int i = 0; i < params.length;i++) {
      if(params[i] % 2 == 0) {
        evenCount++;
      }
      else {
        oddCount++;
      }
    }
    print("Even numbers $evenCount And Odd numbers $oddCount");
}

void main() {
  var array = [30,20,405,60];
  checkOddEven(array);
}