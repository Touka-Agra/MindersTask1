void main() {
  List<int> numbers = [1, 4, 2, 3, 4, 1, 3];
  List<int> once = [];

  numbers.removeWhere((number) {
    if (once.contains(number)) {
      once.remove(number);
      return true;
    }
    once.add(number);
    return false;
  });

  print(once);
}
