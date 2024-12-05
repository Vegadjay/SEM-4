// WAP to generate Fibonacci series of N given number using method.

int fibonacciSeries(int n) {
  if (n == 0 || n == 1) {
    return n;
  }

  return fibonacciSeries(n - 1) + fibonacciSeries(n - 2);
}

void main() {
  for (int i = 0; i < 10; i++) {
    print(fibonacciSeries(i));
  }
}