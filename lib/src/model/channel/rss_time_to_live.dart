import 'package:rss_generator/src/model/rss_object.dart';

/// Specifies the number of minutes the feed can stay cached before refreshing it from the source
/// [https://www.w3schools.com/xml/rss_tag_ttl.asp]
class RssChannelTtl extends RssSingleAttribute {
  RssChannelTtl({
    required int value,
  })  : assert(value >= 0),
        super(key: 'ttl', value: value.toString());
}
