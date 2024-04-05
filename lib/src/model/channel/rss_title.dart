import 'package:rss_generator/src/model/rss_object.dart';

/// Defines the title of the channel
/// [https://www.w3schools.com/xml/rss_tag_title_link_description_channel.asp]
class RssChannelTitle extends RssSingleAttribute {
  RssChannelTitle({
    required super.value,
  }) : super(key: 'title');
}
