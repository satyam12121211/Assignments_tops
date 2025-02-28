import 'dart:io';

int factorial(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}

void main(List<String> args) {
  print("Enter number to factorial of it");
  int a = int.parse(stdin.readLineSync()!);
  print("factorial is ${factorial(a)}");
}
