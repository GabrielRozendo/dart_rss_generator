import 'package:rss_generator/src/model/rss_object.dart';
import 'package:rss_generator/src/utils/randomizer.dart';
import 'package:rss_generator/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

/// Defines a unique identifier for the item.
/// Must be an URL, or a unique key + permalink = false
/// [https://www.w3schools.com/xml/rss_tag_guid.asp]
class RssItemGuid implements RssObject {
  final String? value;
  final bool? permalink;

  RssItemGuid({this.value, this.permalink});

  @override
  void build(XmlBuilder builder) {
    builder.elementWithAttribute(
      name: 'guid',
      value: value ?? Randomizer().generate(),
      attributeLabel: 'isPermaLink',
      attributeValue: permalink ?? false,
    );
  }
}
