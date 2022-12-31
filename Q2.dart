import "dart:io";

void main() {
  // stdout.write("Enter number of integers: ");
  // final int = stdin.readLineSync();

  stdout.write("Enter space separated numbers: ");
  List<double>? numbers =
      stdin.readLineSync()?.split(" ").map((e) => double.parse(e)).toList();

  var max =
      numbers!.reduce((value, element) => value > element ? value : element);
  print("Maximum numberin given sequence is $max");
}
