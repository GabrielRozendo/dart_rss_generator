import 'package:rss_generator/src/model/rss_object.dart';
import 'package:xml/xml.dart';

/// Allows a media file to be included with the item
/// [https://www.w3schools.com/xml/rss_tag_enclosure.asp]
class RssItemEnclosure implements RssObject {
  final int length;
  final String type;
  final String url;

  RssItemEnclosure({
    required this.type,
    required this.length,
    required this.url,
  })  : assert(type.isNotEmpty),
        assert(url.isNotEmpty),
        assert(length >= 0);

  @override
  void build(XmlBuilder builder) {
    builder.element(
      'enclosure',
      attributes: {
        'type': type,
        'length': length.toString(),
        'url': url,
      },
    );
  }
}
