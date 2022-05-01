import 'package:rss_generator/src/model/rss_object.dart';

/// Defines the title of the item
/// [https://www.w3schools.com/xml/rss_tag_title_link_description_item.asp]
class RssItemTitle extends RssSingleAttribute {
  RssItemTitle({
    required String value,
  }) : super(key: 'title', value: value);
}
