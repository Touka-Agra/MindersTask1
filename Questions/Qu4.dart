void main() {
  List<int> numbers = [100, 50, 3, 10, 99, 12];

  numbers.sort();
  int min = numbers.first;
  int max = numbers.last;

  print(min + max);
}
