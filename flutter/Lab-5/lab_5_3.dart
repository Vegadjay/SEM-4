void main() {
  List<String> cities = [
    "Delhi",
    "Mumbai",
    "Bangalore",
    "Hyderabad",
    "Ahmedabad"
  ];

  print("Original List: $cities");

  int index = cities.indexOf("Ahmedabad");
  if (index != -1) {
    cities[index] = "Surat";
    print("Updated List: $cities");
  } else {
    print("City 'Ahmedabad' not found in the list.");
  }
}
