import 'dart:io';

void main() {
  print('enter your grade');
  int grade = int.parse(stdin.readLineSync()!);
  if (grade >= 90 && grade <= 100) {
    print('grade=a');
  } else if (grade >= 80 && grade <= 89) {
    print('grade=b');
  } else if (grade >= 70 && grade <= 79) {
    print('grade=c');
  } else if (grade >= 60 && grade <= 69) {
    print('grade=d');
  } else {
    print('grade=f');
  }
}
