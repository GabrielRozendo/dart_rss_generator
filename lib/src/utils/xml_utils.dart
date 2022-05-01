import 'package:date_time_format/date_time_format.dart';
import 'package:xml/xml.dart';

extension XmlBuilderUtils on XmlBuilder {
  static const String _dateFormat = 'D, d M Y';
  static const String _dateTimeFormat = 'D, d M Y H:i:s O';

  void elementWithAttribute({
    required String name,
    required String value,
    required String attributeLabel,
    required Object attributeValue,
  }) {
    element(
      name,
      nest: () {
        attribute(attributeLabel, attributeValue);
        text(value);
      },
    );
  }

  void dateAttribute(
    String name,
    DateTime value, {
    bool? includeTime,
  }) {
    element(name, nest: () {
      text(_formatDate(
        value,
        includeTime: includeTime,
      ));
    });
  }

  // eg: Sun, 17 Apr 2022 10:22:30 +0200
  String _formatDate(
    DateTime date, {
    bool? includeTime,
  }) {
    final String dateFormat;
    if (includeTime != false) {
      dateFormat = _dateTimeFormat;
    } else {
      dateFormat = _dateFormat;
    }

    return DateTimeFormat.format(date, format: dateFormat);
  }
}
