import 'package:rss_generator/src/model/rss_object.dart';
import 'package:rss_generator/src/utils/object_utils.dart';
import 'package:xml/xml.dart';

/// Allows an image to be displayed when aggregators present a feed
/// [https://www.w3schools.com/xml/rss_tag_image.asp]
class RssChannelImage implements RssObject {
  static const int _minWidth = 88;
  static const int _maxWidth = 144;
  static const int _minHeight = 31;
  static const int _maxHeight = 400;

  final String link;
  final String title;
  final String url;
  final String? description;
  final int? height;
  final int? width;

  RssChannelImage({
    required this.link,
    required this.title,
    required this.url,
    this.description,
    this.height,
    this.width,
  })  : assert(link.isNotEmpty),
        assert(title.isNotEmpty),
        assert(url.isNotEmpty),
        assert(description == null || description.isNotEmpty),
        assert(width == null || (width >= _minWidth && width <= _maxWidth)),
        assert(
            height == null || (height >= _minHeight && height <= _maxHeight));

  @override
  void build(XmlBuilder builder) {
    builder.element(
      'image',
      nest: () {
        builder.attribute('url', url);
        builder.attribute('link', link);
        builder.attribute('title', title);

        description?.let((it) => builder.attribute('description', it));
        (width ?? _minWidth)
            .let((it) => builder.attribute('width', it.toString()));
        (height ?? _minHeight)
            .let((it) => builder.attribute('height', it.toString()));
      },
    );
  }
}
