import 'dart:io';

void main(List<String> args) {
  try {
    print("enter number 1");
    double num1 = double.parse(stdin.readLineSync()!);
    print("Enter number 2");
    double num2 = double.parse(stdin.readLineSync()!);
    double division = num1 / num2;
    print(division);
  } catch (e) {
    print('It is thrown when the number is divided by zero.');
  }
}
