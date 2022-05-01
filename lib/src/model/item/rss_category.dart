import 'package:rss_generator/src/model/rss_object.dart';
import 'package:rss_generator/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

/// Defines one or more categories the item belongs to
/// [https://www.w3schools.com/xml/rss_tag_category_item.asp]
class RssItemCategories implements RssObject {
  final List<RssItemCategory> categories;

  RssItemCategories({
    required this.categories,
  });

  @override
  void build(XmlBuilder builder) {
    for (RssItemCategory category in categories) {
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

class RssItemCategory {
  final String category;
  final String? domain;

  RssItemCategory(
    this.category,
    this.domain,
  ) : assert(category.isNotEmpty);

  bool get hasDomain => domain?.isNotEmpty == true;
}
