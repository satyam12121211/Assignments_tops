import 'dart:io';

double celsiusToFahrahint(double celsius) {
  return (celsius * 9 / 5) + 32;
}

double fahrahintToCelsius(double Fahrahint) {
  return (Fahrahint - 32) * 5 / 9;
}

void main() {
  print('enter the tempretur in celsius');
  double temp = double.parse(stdin.readLineSync()!);
  if (temp == 0) {
    double celsius = double.parse(stdin.readLineSync()!);
    double fahrahint = celsiusToFahrahint(celsius);
    print("temp.$celsius celcius is $fahrahint fahrahint");
    print("");
  } else if (temp == 1) {
    print('enter the tempretur in fahrahint');
    double fahrahint = double.parse(stdin.readLineSync()!);
    double celsius = fahrahintToCelsius(fahrahint);
    print("temp.$fahrahint fahrahint is $celsius celcius");
    print("");
  } else {
    print("invalid input");
    main();
  }
}
