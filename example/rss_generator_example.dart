import 'package:rss_generator/rss_generator.dart';

void main() async {
  var xmlDocument = RssBuilder(
    channelName: 'My WebSite',
    channelDescription: 'My super website',
    channelLink: 'https://flutter-digest.com/',
    channelAtomLink: 'https://rss.flutter-digest.com/',
  )
      .copyright('Copyright 2022')
      .pubDate(DateTime.now())
      .skipDays({RssSkipDay.friday})
      .skipHours({RssSkipHour.hour0})
      .ttl(60)
      .addItem(
        RssItemBuilder(
          title: 'Article 1',
          description: 'Article 1 description',
          link: 'https://archives.flutter-digest.com/latest',
        ),
      )
      .build();

  print(xmlDocument.toXmlString(pretty: true));
}
