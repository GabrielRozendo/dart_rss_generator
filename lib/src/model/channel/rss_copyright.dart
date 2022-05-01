import 'package:rss_generator/src/model/rss_object.dart';

/// Notifies about copyrighted material
/// [https://www.w3schools.com/xml/rss_tag_copyright.asp]
class RssChannelCopyright extends RssSingleAttribute {
  RssChannelCopyright({
    required String value,
  }) : super(key: 'copyright', value: value);
}
