main() {
  _toZigZacConversion(String s, int row) {
    List<String> maps = [];

    String result = "";
    int x = 0;
    int y = 0;
    for (int i = 1; i <= row; i++) {
      maps.add("");
    }
    for (int i = 0; i <= s.length - 1; i++) {
      maps[y] += s[i];
      if (x % (row - 1) == 0 || x == 0) {
        if (y != row - 1) {
          y += 1;
        } else {
          x += 1;
          y -= 1;
        }
      } else {
        x += 1;
        y -= 1;
      }
    }
    for (int i = 0; i <= row - 1; i++) {
      result += maps[i];
    }
    return result;
  }

  print(_toZigZacConversion("LENHATQUANG", 3));
}
