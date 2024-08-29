main() {
  bool isPalindrome(int x) {
    if (x < 0) return false;
    final str = x.toString();
    for (int i = 0; i < (str.length ~/ 2 + 1); i++) {
      if (str[i] != str[str.length - i - 1]) return false;
    }
    return true;
  }

  print(isPalindrome(123321));
}
