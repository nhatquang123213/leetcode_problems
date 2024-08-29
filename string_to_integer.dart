main() {
  bool isNumberic(String s) {
    return double.tryParse(s) != null;
  }

  int myAtoi(String s) {
    String result = s.trim();
    if (result.isEmpty) return 0;
    const MAX = 2147483647;
    const MIN = -2147483648;
    final isNegative = result[0] == "-" ? -1 : 1;
    int number = 0;
    int i = result[0] == "-" || result[0] == "+" ? 1 : 0;
    while (i < result.length && isNumberic(result[i])) {
      number = number * 10 + int.parse(result[i]);
      if (number * isNegative > MAX) return MAX;
      if (number * isNegative < MIN) return MIN;
      i++;
    }
    return number * isNegative;
  }

  return myAtoi("-1337c0d3");
}
