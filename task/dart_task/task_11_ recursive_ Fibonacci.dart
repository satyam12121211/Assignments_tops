int fibonacci(int n) {
  if (n <= 1) {
    return n;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}

void main() {
  int n = 10;
  print('Fibonacci sequence of $n terms:');

  for (int i = 0; i < n; i++) {
    print(fibonacci(i));
  }
}
