import 'package:rss_generator/src/model/item/rss_author.dart';
import 'package:rss_generator/src/model/item/rss_category.dart';
import 'package:rss_generator/src/model/item/rss_comments.dart';
import 'package:rss_generator/src/model/item/rss_description.dart';
import 'package:rss_generator/src/model/item/rss_enclosure.dart';
import 'package:rss_generator/src/model/item/rss_guid.dart';
import 'package:rss_generator/src/model/item/rss_link.dart';
import 'package:rss_generator/src/model/item/rss_pub_date.dart';
import 'package:rss_generator/src/model/item/rss_source.dart';
import 'package:rss_generator/src/model/item/rss_title.dart';
import 'package:rss_generator/src/model/rss_object.dart';
import 'package:rss_generator/src/utils/object_utils.dart';
import 'package:xml/xml.dart';

/// An item within a channel
/// [https://www.w3schools.com/xml/xml_rss.asp#rssref]
class RssItem implements RssObject {
  // Defines the title of the item
  final RssItemTitle title;

  // Describes the item
  final RssItemDescription description;

  // Defines the hyperlink to the item
  final RssItemLink link;

  // Specifies the e-mail address to the author of the item
  RssItemAuthor? author;

  // Defines one or more categories the item belongs to
  RssItemCategories? category;

  // Allows an item to link to comments about that item
  RssItemComments? comments;

  // Allows a media file to be included with the item
  RssItemEnclosure? enclosure;

  // Defines a unique identifier for the item
  RssItemGuid? guid;

  // Defines the last-publication date for the item
  RssItemPubDate? pubDate;

  // Specifies a third-party source for the item
  RssItemSource? source;

  RssItem({
    required String title,
    required String description,
    required String link,
    this.author,
    this.category,
    this.comments,
    this.pubDate,
    this.guid,
    this.source,
    this.enclosure,
  })  : title = RssItemTitle(value: title),
        description = RssItemDescription(value: description),
        link = RssItemLink(value: link);

  @override
  void build(XmlBuilder builder) {
    builder.element('item', nest: () {
      title.build(builder);
      link.build(builder);
      description.build(builder);
      author?.let((it) => it.build(builder));
      category?.let((it) => it.build(builder));
      comments?.let((it) => it.build(builder));
      pubDate?.let((it) => it.build(builder));
      source?.let((it) => it.build(builder));
      enclosure?.let((it) => it.build(builder));

      (guid ?? RssItemGuid()).build(builder);
    });
  }
}
