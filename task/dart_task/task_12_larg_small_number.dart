void findLargestAndSmallest(List<int> numbers) {
  if (numbers.isEmpty) {
    print("List is empty. Please provide numbers.");
    return;
  }

  int smallest = numbers[0];
  int largest = numbers[0];

  for (int number in numbers) {
    if (number < smallest) {
      smallest = number;
    }
    if (number > largest) {
      largest = number;
    }
  }

  print("Smallest number: $smallest");
  print("Largest number: $largest");
}

void main() {
  List<int> myNumbers = [10, 5, 8, 2, 18, 7];
  findLargestAndSmallest(myNumbers);
}
