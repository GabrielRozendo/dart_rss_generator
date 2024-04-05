# rss_generator

[![Pub](https://img.shields.io/pub/v/rss_generator.svg)](https://pub.dartlang.org/packages/rss_generator)

A pure Dart plugin to generate an RSS file (Atom 2 format). 

Validated by the official Feed Validation Service: ![](https://validator.w3.org/feed/images/valid-rss-rogers.png)

To parse an RSS, please have a look at [existing solutions on Pub.dev](https://pub.dev/packages/dart_rss).

## Mandatory fields

In an Atom/RSS fields, here are all the mandatory fields:

- Channel name
- Channel description
- Channel link (= link to a website)
- Atom link (= link to the RSS)
- For each item:
  - A title
  - A description
  - A link

## Installation

1. Add `rss_generator: ^1.0.0` to your `pubspec.yaml` file.
2. Import `import 'package:rss_generator/rss_generator.dart';`
3. Create a `RssBuilder` by proving the multiple mandatory fields:

```dart
RssBuilder builder = RssBuilder(
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
  );
```

4. You will then receive an `XmlDocument` and just have to call:
```dart
XmlDocument doc = builder.build();

// ⬇️ Your document
doc.toXmlString();
```