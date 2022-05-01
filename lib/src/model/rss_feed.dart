import 'package:rss_generator/src/model/channel/rss_channel.dart';
import 'package:rss_generator/src/model/rss_object.dart';
import 'package:xml/xml.dart';

/// A representation of an Atom 2.0 feed
class RssFeed implements RssObject {
  final RssChannel channel;

  RssFeed({
    required this.channel,
  });

  @override
  void build(XmlBuilder builder) {
    builder.declaration(
      version: '1.0',
      encoding: 'UTF-8',
    );

    builder.element('rss', attributes: {
      'xmlns:atom': 'http://www.w3.org/2005/Atom',
      'version': '2.0',
    }, nest: () {
      channel.build(builder);
    });
  }
}
