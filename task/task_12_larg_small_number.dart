import 'dart:io';

void main(List<String> args) {
  print('enter no ');
  int? a = int.parse(stdin.readLineSync()!);
  print('enter no ');
  int? b = int.parse(stdin.readLineSync()!);
  int c = a ~/ b;
  print('Answer:$c');
}
