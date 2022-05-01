part of 'rss_generator_base.dart';

class RssItemBuilder {
  final RssItem _item;

  RssItemBuilder({
    required String title,
    required String description,
    required String link,
  }) : _item = RssItem(
          title: title,
          description: description,
          link: link,
        );

  /// Add the email of the author
  RssItemBuilder author(
    String? author, {
    String? name,
  }) {
    _item.author = author?.let(
      (it) => RssItemAuthor(email: author, name: name),
    );
    return this;
  }

  /// Add a category, by proving a name and an optional domain
  RssItemBuilder category(Map<String, String?>? categories) {
    _item.category = categories?.let((it) {
      if (it.isNotEmpty == true) {
        List<RssItemCategory> categories = [];

        for (String key in it.keys) {
          categories.add(RssItemCategory(key, it[key]));
        }
        return RssItemCategories(categories: categories);
      } else {
        return null;
      }
    });
    return this;
  }

  /// Adds a comment
  RssItemBuilder comments(String? comments) {
    _item.comments = comments?.let((it) => RssItemComments(value: comments));
    return this;
  }

  RssItemBuilder enclosure(
    int? length,
    String? type,
    String? url,
  ) {
    if (length != null && type != null && url != null) {
      _item.enclosure = RssItemEnclosure(
        type: type,
        length: length,
        url: url,
      );
    } else {
      _item.enclosure = null;
    }

    return this;
  }

  RssItemBuilder generateGuid() {
    _item.guid = RssItemGuid();
    return this;
  }

  RssItemBuilder guid(String? guid, bool? permalink) {
    _item.guid = guid?.let(
      (it) => RssItemGuid(value: guid, permalink: permalink),
    );
    return this;
  }

  RssItemBuilder pubDate(
    DateTime? pubDate, {
    bool? includeTime,
  }) {
    _item.pubDate = pubDate?.let((it) => RssItemPubDate(
          date: pubDate,
          includeTime: includeTime,
        ));
    return this;
  }

  RssItemBuilder source(String? name, String? url) {
    if (name != null && url != null) {
      _item.source = RssItemSource(name: name, url: url);
    } else {
      _item.source = null;
    }
    return this;
  }

  RssItem _build() {
    return _item;
  }
}
