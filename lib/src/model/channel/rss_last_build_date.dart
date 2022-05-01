import 'package:rss_generator/src/model/rss_object.dart';
import 'package:rss_generator/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

/// Defines the last-modified date of the content of the feed
/// [https://www.w3schools.com/xml/rss_tag_lastbuilddate.asp]
class RssChannelLastBuildDate implements RssObject {
  final DateTime date;
  final bool? includeTime;

  RssChannelLastBuildDate({
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
