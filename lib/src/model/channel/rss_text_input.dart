import 'package:rss_generator/src/model/rss_object.dart';
import 'package:xml/xml.dart';

/// Specifies a text input field that should be displayed with the feed
/// [https://www.w3schools.com/xml/rss_tag_textinput.asp]
class RssChannelTextInput implements RssObject {
  final String description;
  final String name;
  final String link;
  final String title;

  RssChannelTextInput({
    required this.description,
    required this.name,
    required this.link,
    required this.title,
  })  : assert(description.isNotEmpty),
        assert(name.isNotEmpty),
        assert(link.isNotEmpty),
        assert(title.isNotEmpty);

  @override
  void build(XmlBuilder builder) {
    builder.element(
      'textinput',
      nest: () {
        builder.attribute('description', description);
        builder.attribute('name', name);
        builder.attribute('link', link);
        builder.attribute('title', title);
      },
    );
  }
}
