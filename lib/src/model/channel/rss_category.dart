import 'package:rss_generator/src/model/rss_object.dart';
import 'package:rss_generator/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

/// Defines one or more categories for the feed
/// [https://www.w3schools.com/xml/rss_tag_category_channel.asp]
class RssChannelCategories implements RssObject {
  final List<RssChannelCategory> categories;

  RssChannelCategories({
    required this.categories,
  });

  @override
  void build(XmlBuilder builder) {
    for (RssChannelCategory category in categories) {
      if (category.hasDomain) {
        builder.elementWithAttribute(
          name: 'category',
          value: category.category,
          attributeLabel: 'domain',
          attributeValue: category.domain!,
        );
      } else {
        builder.attribute(
          'category',
          category.category,
        );
      }
    }
  }
}

class RssChannelCategory {
  final String category;
  final String? domain;

  RssChannelCategory(
    this.category,
    this.domain,
  ) : assert(category.isNotEmpty);

  bool get hasDomain => domain?.isNotEmpty == true;
}
