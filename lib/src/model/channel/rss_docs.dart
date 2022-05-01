import 'package:rss_generator/src/model/rss_object.dart';

/// Specifies a URL to the documentation of the format used in the feed
/// [https://www.w3schools.com/xml/rss_tag_docs.asp]
class RssChannelDocs extends RssSingleAttribute {
  RssChannelDocs({
    required String value,
  }) : super(key: 'docs', value: value);
}
