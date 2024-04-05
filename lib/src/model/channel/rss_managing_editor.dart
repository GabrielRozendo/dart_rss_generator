import 'package:rss_generator/src/model/rss_object.dart';

/// Defines the e-mail address to the editor of the content of the feed
/// [https://www.w3schools.com/xml/rss_tag_managingeditor.asp]
class RssChannelManagingEditor extends RssEmailAttribute {
  RssChannelManagingEditor({
    required super.email,
    required super.name,
  }) : super(key: 'managingEditor');
}
