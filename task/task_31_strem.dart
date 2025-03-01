import 'dart:async';

void main() {
  List<int> list1 = [3, 6, 9, 12, 15];
  List<int> list2 = [1, 3, 5, 7, 9];
  List<int> list3 = [2, 4, 6, 8, 10];

  List<int> combinedList = {...list1, ...list2, ...list3}.toList();

  combinedList.sort();

  print(combinedList);

  List<int> numbers = [1, 2, 3, 4, 5];

  List<num> transformList(List<int> list, num Function(int) operation) {
    return list.map(operation).toList();
  }

  num square(int n) => n * n;
  num cube(int n) => n * n * n;
  num half(int n) => n / 2;

  print(transformList(numbers, square)); // Squares
  print(transformList(numbers, cube)); // Cubes
  print(transformList(numbers, half)); // Halves

  Stream<int> generateNumbers(int count) async* {
    for (int i = 1; i <= count; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  generateNumbers(5).listen((number) {
    print('Stream emitted: $number');
  });
}
