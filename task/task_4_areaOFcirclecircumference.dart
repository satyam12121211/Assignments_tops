import 'dart:io';

void main() {
  print('Enter the radius of the circle');
  double radius = double.parse(stdin.readLineSync()!);
  double area = 3.14 * radius * radius;
  double circumference = 2 * 3.14 * radius;
  print('The area of the circle is $area');
  print('The circumference of the circle is $circumference');
}
