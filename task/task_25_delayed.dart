import 'dart:async';

void main() {
  print('Loading...');

  Future.delayed(Duration(seconds: 3), () {
    print('Operation completed!');
  });
}
