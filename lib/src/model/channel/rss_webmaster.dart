import 'package:rss_generator/src/model/rss_object.dart';

/// Defines the e-mail address to the webmaster of the feed
/// [https://www.w3schools.com/xml/rss_tag_webmaster.asp]
class RssChannelWebmaster extends RssEmailAttribute {
  RssChannelWebmaster({
    required super.email,
    required super.name,
  }) : super(key: 'webMaster');
}
