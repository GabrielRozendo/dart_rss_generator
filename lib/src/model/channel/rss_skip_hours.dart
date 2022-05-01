import 'package:rss_generator/src/model/rss_object.dart';
import 'package:xml/xml.dart';

/// Specifies the hours where aggregators should skip updating the feed
/// [https://www.w3schools.com/xml/rss_tag_skipHours.asp]
class RssChannelSkipHours implements RssObject {
  final Set<RssChannelSkipHour> hours;

  RssChannelSkipHours({
    required this.hours,
  });

  @override
  void build(XmlBuilder builder) {
    builder.element(
      'skipHours',
      nest: () {
        for (RssChannelSkipHour hour in hours) {
          builder.element('hour', nest: () {
            builder.text(hour.index);
          });
        }
      },
    );
  }
}

enum RssChannelSkipHour {
  hour0,
  hour1,
  hour2,
  hour3,
  hour4,
  hour5,
  hour6,
  hour7,
  hour8,
  hour9,
  hour10,
  hour11,
  hour12,
  hour13,
  hour14,
  hour15,
  hour16,
  hour17,
  hour18,
  hour19,
  hour20,
  hour21,
  hour22,
  hour23,
}
