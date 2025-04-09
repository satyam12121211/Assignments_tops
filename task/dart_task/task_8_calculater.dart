import 'dart:io';

void main(List<String> args) {
  
  print('select number 1');
  int number1 = int.parse(stdin.readLineSync()!);

  print('select number 2');
  int number2 = int.parse(stdin.readLineSync()!);

  print('select opreters\n1.select+\n2.select-\n3.select*\n4.select/');
  int number = int.parse(stdin.readLineSync()!);

  if (number == 1) {
    print('$number1+$number2=${number1 + number2}');
  } 
  else if (number == 2) {
    print('$number1-$number2=${number1 - number2}');
  }
   else if (number == 3) {
    print('$number1*$number2=${number1 * number2}');
  } 
  else if (number == 4) {
    print('$number1/$number2=${number1 / number2}');
  } 
  else {
    print('invalid input');
  }
}
