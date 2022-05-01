import 'package:rss_generator/src/model/rss_object.dart';
import 'package:rss_generator/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

/// Defines the last publication date for the content of the feed
/// [https://www.w3schools.com/xml/rss_tag_pubdate.asp]
class RssChannelPubDate implements RssObject {
  final DateTime value;
  final bool? includeTime;

  RssChannelPubDate({required this.value, this.includeTime});

  RssChannelPubDate.now() : this(value: DateTime.now());

  @override
  void build(XmlBuilder builder) {
    builder.dateAttribute(
      'pubDate',
      value,
      includeTime: includeTime ?? true,
    );
  }
}
