import 'dart:io';

void main() {
  print("Enter an integer to check Palindrome:");
  int? x = int.tryParse(stdin.readLineSync()!);
  if (x != Null) {
    String s = x.toString();
    String s1 = s.substring(0, s.length ~/ 2);
    String s2 = s.substring((s.length / 2).ceil(), s.length);

    List<String> splittedS2=s2.split("").reversed.toList();
    s2=splittedS2.join();

    bool result = (s1 == s2);
    print(result);
  } else {
    print("Can't Parse");
  }
}
