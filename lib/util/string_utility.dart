import 'dart:convert';
import 'dart:math';

class StringUtility {
  static String generateRandomString() {
    var random = Random.secure();
    var values = List<int>.generate(5, (index) => random.nextInt(100));
    return base64UrlEncode(values);
  }
}
