void main() {
  List<int> list1 = [3, 6, 9, 12, 15];
  List<int> list2 = [1, 3, 5, 7, 9];
  List<int> list3 = [2, 4, 6, 8, 10];

  List<int> combinedList = {...list1, ...list2, ...list3}.toList();

  combinedList.sort();

  print(combinedList);
}
