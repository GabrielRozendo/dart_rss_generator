import 'package:rss_generator/src/model/rss_object.dart';
import 'package:xml/xml.dart';

/// Defines the hyperlink to the channel
/// [https://www.w3schools.com/xml/rss_tag_title_link_description_channel.asp]
class RssChannelAtomLink implements RssObject {
  final String value;

  RssChannelAtomLink({
    required this.value,
  }) : assert(value.isNotEmpty);

  @override
  void build(XmlBuilder builder) {
    builder.element('atom:link', attributes: {
      'href': value,
      'rel': 'self',
    });
  }
}
