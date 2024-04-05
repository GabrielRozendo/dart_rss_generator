import 'package:rss_generator/src/model/rss_object.dart';

/// Defines the hyperlink to the channel
/// [https://www.w3schools.com/xml/rss_tag_title_link_description_channel.asp]
class RssChannelLink extends RssSingleAttribute {
  RssChannelLink({
    required super.value,
  }) : super(key: 'link');
}
