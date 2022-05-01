import 'package:rss_generator/src/model/rss_object.dart';
import 'package:xml/xml.dart';

/// Specifies the days where aggregators should skip updating the feed
/// [https://www.w3schools.com/xml/rss_tag_skipDays.asp]
class RssChannelSkipDays implements RssObject {
  final Set<RssChannelSkipDay> days;

  RssChannelSkipDays({
    required this.days,
  });

  @override
  void build(XmlBuilder builder) {
    builder.element(
      'skipDays',
      nest: () {
        for (RssChannelSkipDay day in days) {
          builder.element('day', nest: () {
            builder.text(day.formatted);
          });
        }
      },
    );
  }
}

enum RssChannelSkipDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension _RssChannelSkipDayExt on RssChannelSkipDay {
  String get formatted {
    switch (this) {
      case RssChannelSkipDay.monday:
        return 'Monday';
      case RssChannelSkipDay.tuesday:
        return 'Tuesday';
      case RssChannelSkipDay.wednesday:
        return 'Wednesday';
      case RssChannelSkipDay.thursday:
        return 'Thursday';
      case RssChannelSkipDay.friday:
        return 'Friday';
      case RssChannelSkipDay.saturday:
        return 'Saturday';
      case RssChannelSkipDay.sunday:
        return 'Sunday';
    }
  }
}
