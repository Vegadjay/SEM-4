import 'dart:io';

void main() {
  Map<String, String> phoneDiary = {};

  print("Enter the number of entries: ");
  int? numberOfEntries = int.tryParse(stdin.readLineSync()!);

  if (numberOfEntries == null || numberOfEntries <= 0) {
    print("Please enter a valid positive number.");
    return;
  }

  for (int i = 0; i < numberOfEntries; i++) {
    print("Enter Name (Key) for entry ${i + 1}:");
    String? key = stdin.readLineSync();
    if (key == null || key.trim().isEmpty) {
      print("Invalid input. Name cannot be empty.");
      i--; // Retry current entry
      continue;
    }

    print("Enter Phone Number (Value) for $key:");
    String? value = stdin.readLineSync();
    if (value == null || value.trim().isEmpty) {
      print("Invalid input. Phone number cannot be empty.");
      i--; // Retry current entry
      continue;
    }

    // Add the key-value pair to the phone diary
    phoneDiary[key] = value;
  }

  // Print the phonebook
  print("\nPhonebook Entries:");
  phoneDiary.forEach((key, value) {
    print("Name: $key, Phone Number: $value");
  });
}
