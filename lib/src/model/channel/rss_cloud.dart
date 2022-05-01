import 'package:rss_generator/src/model/rss_object.dart';
import 'package:rss_generator/src/utils/object_utils.dart';
import 'package:xml/xml.dart';

/// Register processes to be notified immediately of updates of the feed
/// [https://www.w3schools.com/xml/rss_tag_cloud.asp]
class RssChannelCloud implements RssObject {
  final String? domain;
  final String? port;
  final String? path;
  final String? registerProcedure;
  final String? protocol;

  RssChannelCloud({
    this.domain,
    this.port,
    this.path,
    this.registerProcedure,
    this.protocol,
  });

  @override
  void build(XmlBuilder builder) {
    builder.element(
      'cloud',
      attributes: <String, String?>{
        'domain': domain,
        'port': port,
        'path': path,
        'registerProcedure': registerProcedure,
        'protocol': protocol,
      }.removeNullValues(),
    );
  }
}

enum RssChannelCloudProtocol { xmlRpc, soap }
