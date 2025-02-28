import 'dart:io';

void main(List<String> args) {
  List a = [];
  print('Enter a value ');
  int? b = int.parse(stdin.readLineSync()!);
  a.add(b);
  print('asssending');
  print(a);
  int? revers = a.reversed.join() as int?;
}
