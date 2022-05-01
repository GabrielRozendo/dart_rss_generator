part of 'rss_generator_base.dart';

class RssChannelBuilder {
  final RssChannel _channel;

  RssChannelBuilder._({
    required String channelName,
    required String channelDescription,
    required String channelLink,
    required String channelAtomLink,
  }) : _channel = RssChannel(
          title: channelName,
          description: channelDescription,
          link: channelLink,
          atomLink: channelAtomLink,
        );

  RssChannelBuilder _category(Map<String, String?>? categories) {
    _channel.category = categories?.let((it) {
      if (it.isNotEmpty == true) {
        List<RssChannelCategory> categories = [];

        for (String key in it.keys) {
          categories.add(RssChannelCategory(key, it[key]));
        }
        return RssChannelCategories(categories: categories);
      } else {
        return null;
      }
    });
    return this;
  }

  RssChannelBuilder _cloud(
    String? domain,
    String? port,
    String? path,
    String? registerProcedure,
    String? protocol,
  ) {
    _channel.cloud = RssChannelCloud(
      domain: domain,
      port: port,
      path: path,
      registerProcedure: registerProcedure,
      protocol: protocol,
    );
    return this;
  }

  RssChannelBuilder _copyright(String? copyright) {
    _channel.copyright = copyright?.let(
      (it) => RssChannelCopyright(value: copyright),
    );
    return this;
  }

  RssChannelBuilder _docs(String? docs) {
    _channel.docs = docs?.let(
      (it) => RssChannelDocs(value: it),
    );
    return this;
  }

  RssChannelBuilder _generator(String? generator) {
    _channel.generator = generator?.let(
          (it) => RssChannelGenerator(value: it),
        ) ??
        RssChannelGenerator.internal();
    return this;
  }

  RssChannelBuilder _image(
    String? link,
    String? title,
    String? url, {
    String? description,
    int? height,
    int? width,
  }) {
    if (link != null && title != null && url != null) {
      _channel.image = RssChannelImage(
        link: link,
        title: title,
        url: url,
        description: description,
        height: height,
        width: width,
      );
    } else {
      _channel.image = null;
    }
    return this;
  }

  RssChannelBuilder _language(String? lng) {
    _channel.language = lng?.let(
      (it) => RssChannelLanguage(value: it),
    );
    return this;
  }

  RssChannelBuilder _lastBuildDate(
    DateTime? buildDate, {
    bool? includeTime,
  }) {
    _channel.lastBuildDate = buildDate?.let(
      (it) => RssChannelLastBuildDate(
        date: it,
        includeTime: includeTime,
      ),
    );
    return this;
  }

  RssChannelBuilder _managingEditor(String? editor, String? name) {
    _channel.managingEditor = editor?.let(
      (it) => RssChannelManagingEditor(email: it, name: name),
    );
    return this;
  }

  RssChannelBuilder _pubDate(
    DateTime? pubDate, {
    bool? includeTime,
  }) {
    _channel.pubDate = pubDate?.let(
      (it) => RssChannelPubDate(
        value: it,
        includeTime: includeTime,
      ),
    );
    return this;
  }

  RssChannelBuilder _rating(String? rating) {
    _channel.rating = rating?.let(
      (it) => RssChannelRating(value: it),
    );
    return this;
  }

  RssChannelBuilder _skipDays(Set<RssSkipDay>? skipDays) {
    if (skipDays == null || skipDays.isEmpty) {
      _channel.skipDays = null;
    } else {
      _channel.skipDays = RssChannelSkipDays(
          days: skipDays.map((RssSkipDay e) {
        switch (e) {
          case RssSkipDay.monday:
            return RssChannelSkipDay.monday;
          case RssSkipDay.tuesday:
            return RssChannelSkipDay.tuesday;
          case RssSkipDay.wednesday:
            return RssChannelSkipDay.wednesday;
          case RssSkipDay.thursday:
            return RssChannelSkipDay.thursday;
          case RssSkipDay.friday:
            return RssChannelSkipDay.friday;
          case RssSkipDay.saturday:
            return RssChannelSkipDay.saturday;
          case RssSkipDay.sunday:
            return RssChannelSkipDay.sunday;
        }
      }).toSet());
    }
    return this;
  }

  RssChannelBuilder _skipHours(Set<RssSkipHour>? skipHours) {
    if (skipHours == null || skipHours.isEmpty) {
      _channel.skipHours = null;
    } else {
      _channel.skipHours = RssChannelSkipHours(
          hours: skipHours.map((RssSkipHour e) {
        switch (e) {
          case RssSkipHour.hour0:
            return RssChannelSkipHour.hour0;
          case RssSkipHour.hour1:
            return RssChannelSkipHour.hour1;
          case RssSkipHour.hour2:
            return RssChannelSkipHour.hour2;
          case RssSkipHour.hour3:
            return RssChannelSkipHour.hour3;
          case RssSkipHour.hour4:
            return RssChannelSkipHour.hour4;
          case RssSkipHour.hour5:
            return RssChannelSkipHour.hour5;
          case RssSkipHour.hour6:
            return RssChannelSkipHour.hour6;

          case RssSkipHour.hour7:
            return RssChannelSkipHour.hour7;
          case RssSkipHour.hour8:
            return RssChannelSkipHour.hour8;
          case RssSkipHour.hour9:
            return RssChannelSkipHour.hour9;
          case RssSkipHour.hour10:
            return RssChannelSkipHour.hour10;
          case RssSkipHour.hour11:
            return RssChannelSkipHour.hour11;
          case RssSkipHour.hour12:
            return RssChannelSkipHour.hour12;
          case RssSkipHour.hour13:
            return RssChannelSkipHour.hour13;
          case RssSkipHour.hour14:
            return RssChannelSkipHour.hour14;
          case RssSkipHour.hour15:
            return RssChannelSkipHour.hour15;
          case RssSkipHour.hour16:
            return RssChannelSkipHour.hour16;
          case RssSkipHour.hour17:
            return RssChannelSkipHour.hour17;
          case RssSkipHour.hour18:
            return RssChannelSkipHour.hour18;
          case RssSkipHour.hour19:
            return RssChannelSkipHour.hour19;
          case RssSkipHour.hour20:
            return RssChannelSkipHour.hour20;
          case RssSkipHour.hour21:
            return RssChannelSkipHour.hour21;
          case RssSkipHour.hour22:
            return RssChannelSkipHour.hour22;
          case RssSkipHour.hour23:
            return RssChannelSkipHour.hour23;
        }
      }).toSet());
    }
    return this;
  }

  RssChannelBuilder _textInput(
    String? description,
    String? name,
    String? link,
    String? title,
  ) {
    if (description != null && name != null && link != null && title != null) {
      _channel.textInput = RssChannelTextInput(
        description: description,
        name: name,
        link: link,
        title: title,
      );
    } else {
      _channel.textInput = null;
    }

    return this;
  }

  RssChannelBuilder _ttl(int? ttl) {
    _channel.ttl = ttl?.let(
      (it) => RssChannelTtl(value: it),
    );
    return this;
  }

  RssChannelBuilder _webmaster(String? webmaster, String? name) {
    _channel.webmaster = webmaster?.let(
      (it) => RssChannelWebmaster(email: it, name: name),
    );
    return this;
  }

  RssChannelBuilder _addItem(RssItemBuilder builder) {
    _channel.items.add(builder._build());
    return this;
  }

  RssChannel _build() {
    _channel.generator ??= RssChannelGenerator.internal();
    _channel.pubDate ??= RssChannelPubDate.now();
    return _channel;
  }
}

enum RssSkipDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

enum RssSkipHour {
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
