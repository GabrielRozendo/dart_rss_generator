import 'package:rss_generator/src/model/channel/rss_atom_link.dart';
import 'package:rss_generator/src/model/channel/rss_category.dart';
import 'package:rss_generator/src/model/channel/rss_cloud.dart';
import 'package:rss_generator/src/model/channel/rss_copyright.dart';
import 'package:rss_generator/src/model/channel/rss_description.dart';
import 'package:rss_generator/src/model/channel/rss_docs.dart';
import 'package:rss_generator/src/model/channel/rss_generator.dart';
import 'package:rss_generator/src/model/channel/rss_image.dart';
import 'package:rss_generator/src/model/channel/rss_language.dart';
import 'package:rss_generator/src/model/channel/rss_last_build_date.dart';
import 'package:rss_generator/src/model/channel/rss_link.dart';
import 'package:rss_generator/src/model/channel/rss_managing_editor.dart';
import 'package:rss_generator/src/model/channel/rss_pub_date.dart';
import 'package:rss_generator/src/model/channel/rss_rating.dart';
import 'package:rss_generator/src/model/channel/rss_skip_days.dart';
import 'package:rss_generator/src/model/channel/rss_skip_hours.dart';
import 'package:rss_generator/src/model/channel/rss_text_input.dart';
import 'package:rss_generator/src/model/channel/rss_time_to_live.dart';
import 'package:rss_generator/src/model/channel/rss_title.dart';
import 'package:rss_generator/src/model/channel/rss_webmaster.dart';
import 'package:rss_generator/src/model/item/rss_item.dart';
import 'package:rss_generator/src/model/rss_object.dart';
import 'package:rss_generator/src/utils/object_utils.dart';
import 'package:xml/xml.dart';

/// The <channel> element describes the RSS feed, and has three required child elements:
///
/// <title> - Defines the title of the channel (e.g. W3Schools Home Page)
/// <link> - Defines the hyperlink to the channel (e.g. https://www.w3schools.com)
/// <description> - Describes the channel (e.g. Free web building tutorials)
/// The <channel> element usually contains one or more <item> elements. Each <item> element defines an article or "story" in the RSS feed.
///
/// Furthermore, there are several optional child elements of <channel>. We will explain the most important ones below.
/// [https://www.w3schools.com/xml/xml_rss.asp#rssref]
class RssChannel implements RssObject {
  // Defines the title of the channel
  final RssChannelTitle title;

  // Describes the channel
  final RssChannelDescription description;

  // Defines the hyperlink to the channel (website URL)
  final RssChannelLink link;

  // Defines the hyperlink to the channel (feed URL)
  final RssChannelAtomLink atomLink;

  RssChannelCategories? category;
  // Defines one or more categories for the feed

  RssChannelCloud? cloud;
  // Register processes to be notified immediately of updates of the feed

  RssChannelCopyright? copyright;
  // Notifies about copyrighted material

  RssChannelDocs? docs;
  // Specifies a URL to the documentation of the format used in the feed

  RssChannelGenerator? generator;
  // Specifies the program used to generate the feed

  RssChannelImage? image;
  // Allows an image to be displayed when aggregators present a feed

  RssChannelLanguage? language;
  // Specifies the language the feed is written in

  RssChannelLastBuildDate? lastBuildDate;
  // Defines the last-modified date of the content of the feed

  RssChannelManagingEditor? managingEditor;
  // Defines the e-mail address to the editor of the content of the feed

  RssChannelPubDate? pubDate;
  // Defines the last publication date for the content of the feed

  RssChannelRating? rating;
  // The PICS rating of the feed

  RssChannelSkipDays? skipDays;
  // Specifies the days where aggregators should skip updating the feed

  RssChannelSkipHours? skipHours;
  // Specifies the hours where aggregators should skip updating the feed

  RssChannelTextInput? textInput;
  // Specifies a text input field that should be displayed with the feed

  RssChannelTtl? ttl;
  // Specifies the number of minutes the feed can stay cached before refreshing it from the source

  RssChannelWebmaster? webmaster;
  // Defines the e-mail address to the webmaster of the feed

  List<RssItem> items;
  // Each <item> element defines an article or "story" in the RSS feed.

  RssChannel({
    required String title,
    required String description,
    required String link,
    required String atomLink,
    this.category,
    this.cloud,
    this.copyright,
    this.docs,
    this.generator,
    this.image,
    this.language,
    this.lastBuildDate,
    this.managingEditor,
    this.pubDate,
    this.rating,
    this.skipDays,
    this.skipHours,
    this.textInput,
    this.ttl,
    this.webmaster,
    List<RssItem>? items,
  })  : title = RssChannelTitle(value: title),
        description = RssChannelDescription(value: description),
        link = RssChannelLink(value: link),
        atomLink = RssChannelAtomLink(value: atomLink),
        items = items ?? [];

  @override
  void build(XmlBuilder builder) {
    builder.element(
      'channel',
      nest: () {
        title.let((it) => it.build(builder));
        description.let((it) => it.build(builder));
        link.let((it) => it.build(builder));
        atomLink.let((it) => it.build(builder));

        category?.let((it) => it.build(builder));
        cloud?.let((it) => it.build(builder));
        copyright?.let((it) => it.build(builder));
        docs?.let((it) => it.build(builder));
        generator?.let((it) => it.build(builder));
        image?.let((it) => it.build(builder));
        language?.let((it) => it.build(builder));
        lastBuildDate?.let((it) => it.build(builder));
        managingEditor?.let((it) => it.build(builder));
        pubDate?.let((it) => it.build(builder));
        rating?.let((it) => it.build(builder));
        skipDays?.let((it) => it.build(builder));
        skipHours?.let((it) => it.build(builder));
        textInput?.let((it) => it.build(builder));
        ttl?.let((it) => it.build(builder));
        webmaster?.let((it) => it.build(builder));

        for (RssItem item in items) {
          item.build(builder);
        }
      },
    );
  }
}
