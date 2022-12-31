import 'dart:io';

void main() {
  bool proceed;

  do {
    stdout.write("Enter first operand: ");
    var op1 = double.parse(stdin.readLineSync()!);
    stdout.write("Enter second operand: ");
    var op2 = double.parse(stdin.readLineSync()!);

    print(
        "Choose operation:\n1. Addition\n2. Subtraction\n3. Multiplication\n4. Division");
    stdout.write("Enter your choice (1, 2, 3, 4): ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        var result = op1 + op2;
        print("The result is: $result");
        break;
      case "2":
        var result = op1 - op2;
        print("The result is: $result");
        break;
      case "3":
        var result = op1 * op2;
        print("The result is: $result");
        break;
      case "4":
        var result = op1 / op2;
        print("The result is: $result");
        break;
      default:
        print("Enter a valid choice!");
    }

    stdout.write("Do you wish to proceed? (y/n) ");
    proceed = stdin.readLineSync() == "y" ? true : false;
  } while (proceed);
}
