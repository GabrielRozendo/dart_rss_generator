import 'package:rss_generator/src/model/channel/rss_category.dart';
import 'package:rss_generator/src/model/channel/rss_channel.dart';
import 'package:rss_generator/src/model/channel/rss_cloud.dart';
import 'package:rss_generator/src/model/channel/rss_copyright.dart';
import 'package:rss_generator/src/model/channel/rss_docs.dart';
import 'package:rss_generator/src/model/channel/rss_generator.dart';
import 'package:rss_generator/src/model/channel/rss_image.dart';
import 'package:rss_generator/src/model/channel/rss_language.dart';
import 'package:rss_generator/src/model/channel/rss_last_build_date.dart';
import 'package:rss_generator/src/model/channel/rss_managing_editor.dart';
import 'package:rss_generator/src/model/channel/rss_pub_date.dart';
import 'package:rss_generator/src/model/channel/rss_rating.dart';
import 'package:rss_generator/src/model/channel/rss_skip_days.dart';
import 'package:rss_generator/src/model/channel/rss_skip_hours.dart';
import 'package:rss_generator/src/model/channel/rss_text_input.dart';
import 'package:rss_generator/src/model/channel/rss_time_to_live.dart';
import 'package:rss_generator/src/model/channel/rss_webmaster.dart';
import 'package:rss_generator/src/model/item/rss_author.dart';
import 'package:rss_generator/src/model/item/rss_category.dart';
import 'package:rss_generator/src/model/item/rss_comments.dart';
import 'package:rss_generator/src/model/item/rss_enclosure.dart';
import 'package:rss_generator/src/model/item/rss_guid.dart';
import 'package:rss_generator/src/model/item/rss_item.dart';
import 'package:rss_generator/src/model/item/rss_pub_date.dart';
import 'package:rss_generator/src/model/item/rss_source.dart';
import 'package:rss_generator/src/model/rss_feed.dart';
import 'package:rss_generator/src/utils/object_utils.dart';
import 'package:xml/xml.dart';

part 'rss_channel_builder.dart';
part 'rss_item_builder.dart';

class RssBuilder {
  final RssChannelBuilder _channelBuilder;

  RssBuilder({
    required String channelName,
    required String channelDescription,
    required String channelLink,
    required String channelAtomLink,
  }) : _channelBuilder = RssChannelBuilder._(
          channelName: channelName,
          channelDescription: channelDescription,
          channelLink: channelLink,
          channelAtomLink: channelAtomLink,
        );

  RssBuilder category(Map<String, String?>? categories) {
    _channelBuilder._category(categories);
    return this;
  }

  RssBuilder cloud(
    String? domain,
    String? port,
    String? path,
    String? registerProcedure,
    String? protocol,
  ) {
    _channelBuilder._cloud(domain, port, path, registerProcedure, protocol);
    return this;
  }

  RssBuilder copyright(String? copyright) {
    _channelBuilder._copyright(copyright);
    return this;
  }

  RssBuilder docs(String? docs) {
    _channelBuilder._docs(docs);
    return this;
  }

  RssBuilder generator(String? generator) {
    _channelBuilder._generator(generator);
    return this;
  }

  RssBuilder image(
    String? link,
    String? title,
    String? url, {
    String? description,
    int? height,
    int? width,
  }) {
    _channelBuilder._image(
      link,
      title,
      url,
      description: description,
      height: height,
      width: width,
    );
    return this;
  }

  RssBuilder language(String? lng) {
    _channelBuilder._language(lng);
    return this;
  }

  RssBuilder lastBuildDate(DateTime? buildDate) {
    _channelBuilder._lastBuildDate(buildDate);
    return this;
  }

  RssBuilder managingEditor(
    String? editor, {
    String? name,
  }) {
    _channelBuilder._managingEditor(editor, name);
    return this;
  }

  RssBuilder pubDate(DateTime? pubDate) {
    _channelBuilder._pubDate(pubDate);
    return this;
  }

  RssBuilder rating(String? rating) {
    _channelBuilder._rating(rating);
    return this;
  }

  RssBuilder skipDays(Set<RssSkipDay>? skipDays) {
    _channelBuilder._skipDays(skipDays);
    return this;
  }

  RssBuilder skipHours(Set<RssSkipHour>? skipHours) {
    _channelBuilder._skipHours(skipHours);
    return this;
  }

  RssBuilder textInput(
    String? description,
    String? name,
    String? link,
    String? title,
  ) {
    _channelBuilder._textInput(description, name, link, title);
    return this;
  }

  RssBuilder ttl(int? ttl) {
    _channelBuilder._ttl(ttl);
    return this;
  }

  RssBuilder webmaster(
    String? webmaster, {
    String? name,
  }) {
    _channelBuilder._webmaster(webmaster, name);
    return this;
  }

  RssBuilder addItem(RssItemBuilder builder) {
    _channelBuilder._addItem(builder);
    return this;
  }

  XmlDocument build() {
    final XmlBuilder builder = XmlBuilder();

    RssFeed(
      channel: _channelBuilder._build(),
    ).build(builder);

    return builder.buildDocument();
  }
}
