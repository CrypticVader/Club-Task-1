import 'dart:io';

void main() {
  stdout.write("Enter number of inputs: ");
  int n = int.parse(stdin.readLineSync() ?? "0");
  Map<String, int> details = {};

  for (int i = 0; i < n; i++) {
    stdout.write("Enter student details: ");
    List temp = stdin.readLineSync()!.split(":");
    details[temp[0]] = int.parse(temp[1]);
  }

  print(details);

  Map<String, int> range = {
    "0-10": 0,
    "10-20": 0,
    "20-30": 0,
    "30-40": 0,
    "40-50": 0,
    "50-60": 0,
    "60-70": 0,
    "70-80": 0,
    "80-90": 0,
    "90-100": 0,
  };

  // Segregate the data.
  details.forEach((key, value) {
    if (value >= 0 && value <= 10) {
      range["0-10"] = range["0-10"]! + 1;
    } else if (value >= 10 && value <= 20) {
      range["10-20"] = range["10-20"]! + 1;
    } else if (value >= 20 && value <= 30) {
      range["20-30"] = range["20-30"]! + 1;
    } else if (value >= 30 && value <= 40) {
      range["30-40"] = range["30-40"]! + 1;
    } else if (value >= 40 && value <= 50) {
      range["40-50"] = range["40-50"]! + 1;
    } else if (value >= 50 && value <= 60) {
      range["50-60"] = range["50-60"]! + 1;
    } else if (value >= 60 && value <= 70) {
      range["60-70"] = range["60-70"]! + 1;
    } else if (value >= 70 && value <= 80) {
      range["70-80"] = range["70-80"]! + 1;
    } else if (value >= 80 && value <= 90) {
      range["80-90"] = range["80-90"]! + 1;
    } else if (value >= 90 && value <= 100) {
      range["90-100"] = range["90-100"]! + 1;
    }
  });

  // Print the segregated data.
  range.forEach((key, value) {
    print("$key: $value");
  });
}
