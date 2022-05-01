import 'dart:math';

import 'package:rss_generator/src/model/item/rss_guid.dart';

/// Generate a random String containing characters and numbers
/// Used mainly for [RssItemGuid]
class Randomizer {
  static final String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Set<String> _generatedContent = {};

  static final Randomizer _singleton = Randomizer._internal();

  factory Randomizer() {
    return _singleton;
  }

  Randomizer._internal();

  String generate() {
    String str = _generateRandomString();

    while (_generatedContent.contains(str)) {
      str = _generateRandomString();
    }

    _generatedContent.add(str);
    return str;
  }

  String _generateRandomString({int length = 16}) {
    Random r = Random();

    return List.generate(
      length,
      (index) => _chars[r.nextInt(_chars.length)],
    ).join();
  }

  void reset() {
    _generatedContent.clear();
  }
}
