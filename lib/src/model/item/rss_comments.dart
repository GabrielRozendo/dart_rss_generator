import 'package:rss_generator/src/model/rss_object.dart';

/// Allows an item to link to comments about that item
/// [https://www.w3schools.com/xml/rss_tag_comments.asp]
class RssItemComments extends RssSingleAttribute {
  RssItemComments({
    required super.value,
  }) : super(key: 'comments');
}
