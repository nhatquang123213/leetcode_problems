import 'dart:math';

main() {
  int reverse(int x) {
    String s = (x < 0 ? -x : x).toString();
    s = s.split('').reversed.join();
    final result = x < 0 ? -int.parse(s) : int.parse(s);
    if (result < -(pow(2, 31)) || result > (pow(2, 31) - 1)) return 0;
    return result;
  }

  print(reverse(-32144));
}
