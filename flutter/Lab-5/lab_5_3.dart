// WAP that creates List with following value:“Delhi”, “Mumbai”, “Bangalore”, “Hyderabad” and
// “Ahmedabad” Replace “Ahmedabad” with “Surat” in above List.

void main() {
  List<String> citys = ["Delhi", "Mumbai" , "Bangalore", "Hyderabad", "Ahmedabad"];

  int idx = citys.indexOf("Ahmedabad");
  citys[idx] = "Surat";
  print(citys);

  // citys.asMap().forEach((index,value) {
  //   if(citys[index] == "Ahmedabad") {
  //     citys[index] = "Surat";
  //   };
  // });
  //
  print(citys);
  }
