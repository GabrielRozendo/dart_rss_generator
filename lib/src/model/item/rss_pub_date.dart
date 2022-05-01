import 'package:rss_generator/src/model/rss_object.dart';
import 'package:rss_generator/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

/// Defines the last-publication date for the item
/// [https://www.w3schools.com/xml/rss_tag_pubdate_item.asp]
class RssItemPubDate implements RssObject {
  final DateTime date;
  final bool? includeTime;

  RssItemPubDate({
    required this.date,
    this.includeTime,
  });

  @override
  void build(XmlBuilder builder) {
    builder.dateAttribute(
      'pubDate',
      date,
      includeTime: includeTime,
    );
  }
}
