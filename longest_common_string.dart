main() {
  _getCommonPrefix(List<String> data) {
    if (data.isEmpty) return "";
    String result = "";
    while (true) {
      try {
        result += data.first[result.length];
        if (data.any((e) => !e.startsWith(result))) {
          result = result.substring(0, result.length - 1);
          break;
        }
      } catch (e) {
        break;
      }
    }
    return result;
  }

  print(_getCommonPrefix(["abc", "abdd", "add"]));
}
