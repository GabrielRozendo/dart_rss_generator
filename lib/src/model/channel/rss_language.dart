import 'package:intl/locale.dart';
import 'package:rss_generator/src/model/rss_object.dart';

/// Specifies the language the feed is written in
/// [https://www.w3schools.com/xml/rss_tag_language.asp]
class RssChannelLanguage extends RssSingleAttribute {
  RssChannelLanguage({
    required super.value,
  })  : assert(_checkLanguage(value)),
        super(key: 'language');

  static bool _checkLanguage(String lng) {
    try {
      Locale.parse(lng);
      return true;
    } catch (_) {
      return false;
    }
  }
}
