import 'package:rss_generator/src/model/rss_object.dart';

/// Specifies the e-mail address to the author of the item
/// [https://www.w3schools.com/xml/rss_tag_author.asp]
class RssItemAuthor extends RssEmailAttribute {
  RssItemAuthor({
    required String email,
    required String? name,
  }) : super(key: 'source', email: email, name: name);
}
