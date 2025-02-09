void main() {
  String s = "Minders Flutter Committee is the best";
  s = s.trim(); //for spaces at the end
  List<String> splittedS = s.split(" ");
  print(splittedS.last.length);
}
