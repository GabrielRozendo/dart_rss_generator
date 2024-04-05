import 'package:rss_generator/src/model/rss_object.dart';

/// The PICS rating of the feed
class RssChannelRating extends RssSingleAttribute {
  RssChannelRating({
    required super.value,
  }) : super(key: 'rating');
}
