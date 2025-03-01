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

  print(transformList(numbers, square));
  print(transformList(numbers, cube));
  print(transformList(numbers, half));
}
