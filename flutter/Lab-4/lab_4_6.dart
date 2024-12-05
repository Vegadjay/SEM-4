// WAP to sort an array of names based on the corresponding heights in descending order. The
// names and heights are given as two separate arrays, and the heights are distinct positive
// integers. Example: Input: names = ["Mary","John","Emma"], heights = [180,165,170], Output:
// ["Mary","Emma","John"]; Input: names = ["Alice","Bob","Bob"], heights = [155,185,150],
// Output: ["Bob","Alice","Bob"].

void setNames(var names, var height) {
  for(int i = 0; i < names.length; i++) {
    for(int j = 0; j < names.length - i - 1; j++) {
      if(height[j] < height[j + 1])  {
        int temp = height[j];
        height[j] = height[j+1];
        height[j+1] = temp;
        String tempName = names[j];
        names[j] = names[j+1];
        names[j+1] = tempName;
      }
    }
  }
  print(names);
}

void main() {
  var height = [180,165,170];
  var names = ['Mary', 'John', 'Emma'];
  setNames(names,height);
}