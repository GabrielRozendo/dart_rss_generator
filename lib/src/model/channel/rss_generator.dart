import 'package:rss_generator/src/model/rss_object.dart';

/// Specifies the program used to generate the feed
/// [https://www.w3schools.com/xml/rss_tag_generator.asp]
class RssChannelGenerator extends RssSingleAttribute {
  RssChannelGenerator({
    required super.value,
  }) : super(key: 'generator');

  RssChannelGenerator.internal() : this(value: 'Dart RSS Generator');
}
