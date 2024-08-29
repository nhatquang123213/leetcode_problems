void main() {
  int _romanToInteger(String s) {
    int result = 0;
    List<String> keys = ['I', 'V', 'X', 'L', 'C', 'D', 'M'];
    List<int> values = [1, 5, 10, 50, 100, 500, 1000];
    for (int i = 0; i <= s.length - 1; i++) {
      final index = keys.indexOf(s[i]);
      if (s.length > 1 && i < s.length - 1 && index < keys.indexOf(s[i + 1])) {
        result -= values[index];
      } else {
        result += values[index];
      }
    }
    return result;
  }

  print(_romanToInteger("XII"));
}
