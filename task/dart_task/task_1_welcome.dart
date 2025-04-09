import 'dart:io';

void main() {
  print('enter your name');
  String? name = stdin.readLineSync();
  print('Welcome $name');
  print('enter your age');
  int age = int.parse(stdin.readLineSync()!);
  int yearleft = 100 - age;
  print('you have $yearleft years left to be 100 years old');
}
