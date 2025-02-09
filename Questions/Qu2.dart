void main() {
  List<int> all = [1, 2, 3, 4, 5, 1, 6, 6, 10, 1];
  List<int> val = [1, 2, 10];
  List<int> res = [];

  all.removeWhere((number) {
    if (val.contains(number)) {
      res.add(number);
      return true;
    }
    return false;
  });

  print(res);
}
