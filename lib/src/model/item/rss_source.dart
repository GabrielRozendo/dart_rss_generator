import 'package:rss_generator/src/model/rss_object.dart';
import 'package:rss_generator/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

/// Specifies a third-party source for the item
/// [https://www.w3schools.com/xml/rss_tag_source.asp]
class RssItemSource implements RssObject {
  final String name;
  final String url;

  RssItemSource({
    required this.name,
    required this.url,
  })  : assert(name.isNotEmpty),
        assert(url.startsWith('http'));

  @override
  void build(XmlBuilder builder) {
    builder.elementWithAttribute(
      name: 'source',
      value: name,
      attributeLabel: 'url',
      attributeValue: url,
    );
  }
}
