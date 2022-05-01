import 'package:rss_generator/src/model/rss_object.dart';

/// Defines the e-mail address to the webmaster of the feed
/// [https://www.w3schools.com/xml/rss_tag_webmaster.asp]
class RssChannelWebmaster extends RssEmailAttribute {
  RssChannelWebmaster({
    required String email,
    required String? name,
  }) : super(key: 'webMaster', email: email, name: name);
}
