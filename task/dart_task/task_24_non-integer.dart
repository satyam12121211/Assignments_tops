import 'dart:io';

int factorial(int number) {
  if (number < 0) {
    throw ArgumentError("Factorial is not defined for negative numbers.");
  }
  return number == 0 ? 1 : number * factorial(number - 1);
}

bool isPalindrome(String str) {
  String reversed = str.split('').reversed.join('');
  return str == reversed;
}

int fibonacci(int n) {
  if (n < 0) {
    throw ArgumentError("Fibonacci is not defined for negative numbers.");
  }
  if (n == 0) return 0;
  if (n == 1) return 1;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void readFile(String filePath) {
  try {
    File file = File(filePath);
    if (!file.existsSync()) {
      throw FileSystemException("File not found", filePath);
    }
    String contents = file.readAsStringSync();
    print("File Contents:\n$contents");
  } catch (e) {
    print("Error: \${e.toString()}");
  }
}

void calculator() {
  while (true) {
    try {
      stdout.write("Enter first number: ");
      double num1 = double.parse(stdin.readLineSync()!);

      stdout.write("Enter an operator (+, -, *, /): ");
      String operator = stdin.readLineSync()!;

      stdout.write("Enter second number: ");
      double num2 = double.parse(stdin.readLineSync()!);

      double result;
      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 == 0) {
            print("Error: Division by zero is not allowed.");
            continue;
          }
          result = num1 / num2;
          break;
        default:
          print("Invalid operator. Please enter +, -, *, or /");
          continue;
      }
      print("Result: \$result");
      break;
    } catch (e) {
      print("Invalid input. Please enter valid numbers and an operator.");
    }
  }
}

void inputIntegerList() {
  List<int> numbers = [];
  while (true) {
    try {
      stdout.write("Enter a list of integers separated by spaces: ");
      List<String> inputs = stdin.readLineSync()!.split(' ');
      numbers = inputs.map((e) => int.parse(e)).toList();
      break;
    } catch (e) {
      print("Invalid input. Please enter only integers separated by spaces.");
    }
  }
  print("You entered: \$numbers");
}

void main() {
  try {
    stdout.write("Enter a number to calculate its factorial: ");
    int? number = int.tryParse(stdin.readLineSync()!);

    if (number == null) {
      print("Invalid input. Please enter a valid integer.");
    } else {
      print("Factorial of $number is: \${factorial(number)}");
    }
  } catch (e) {
    print("Error: \${e.toString()}");
  }

  try {
    stdout.write("Enter a string to check if it's a palindrome: ");
    String input = stdin.readLineSync()!;
    if (isPalindrome(input)) {
      print("'$input' is a palindrome.");
    } else {
      print("'$input' is not a palindrome.");
    }
  } catch (e) {
    print("Error: \${e.toString()}");
  }

  try {
    stdout.write("Enter a number to generate Fibonacci series up to: ");
    int? fibNum = int.tryParse(stdin.readLineSync()!);

    if (fibNum == null || fibNum < 0) {
      print("Invalid input. Please enter a non-negative integer.");
    } else {
      List<int> fibSeries = List.generate(fibNum, (i) => fibonacci(i));
      print(
        "Fibonacci series up to $fibNum: \${fibSeries.join("
        ")}",
      );
    }
  } catch (e) {
    print("Error: \${e.toString()}");
  }

  try {
    stdout.write("Enter numerator: ");
    double? numerator = double.tryParse(stdin.readLineSync()!);

    stdout.write("Enter denominator: ");
    double? denominator = double.tryParse(stdin.readLineSync()!);

    if (numerator == null || denominator == null) {
      print("Invalid input. Please enter valid numbers.");
    } else {
      if (denominator == 0) {
        print("Error: Division by zero is not allowed.");
      } else {
        double result = numerator / denominator;
        print("Result: \$result");
      }
    }
  } catch (e) {
    print("Error: \${e.toString()}");
  }

  try {
    stdout.write("Enter the file path to read: ");
    String filePath = stdin.readLineSync()!;
    readFile(filePath);
  } catch (e) {
    print("Error: \${e.toString()}");
  }

  calculator();
  inputIntegerList();
}
