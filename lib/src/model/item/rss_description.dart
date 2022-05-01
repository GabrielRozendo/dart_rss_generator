import 'package:rss_generator/src/model/rss_object.dart';

/// Describes the item
/// [https://www.w3schools.com/xml/rss_tag_title_link_description_item.asp]
class RssItemDescription extends RssSingleAttribute {
  RssItemDescription({
    required String value,
  }) : super(key: 'description', value: value);
}
