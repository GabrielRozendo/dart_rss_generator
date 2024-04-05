import 'package:rss_generator/src/model/rss_object.dart';

/// Defines the hyperlink to the item
/// [https://www.w3schools.com/xml/rss_tag_title_link_description_item.asp]
class RssItemLink extends RssSingleAttribute {
  RssItemLink({
    required super.value,
  }) : super(key: 'link');
}
