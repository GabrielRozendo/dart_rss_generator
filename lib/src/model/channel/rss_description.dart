import 'package:rss_generator/src/model/rss_object.dart';

/// Describes the channel
/// [https://www.w3schools.com/xml/rss_tag_title_link_description_channel.asp]
class RssChannelDescription extends RssSingleAttribute {
  RssChannelDescription({
    required super.value,
  }) : super(key: 'description');
}
