import 'package:xml/xml.dart';

/// Base object for an encodable field
abstract class RssObject {
  void build(XmlBuilder builder);
}

/// A field with a <key, value> pair
abstract class RssSingleAttribute implements RssObject {
  final String value;
  final String _key;

  RssSingleAttribute({
    required this.value,
    required String key,
  })  : _key = key,
        assert(key.isNotEmpty),
        assert(value.isNotEmpty);

  @override
  void build(XmlBuilder builder) {
    builder.element(
      _key,
      nest: () {
        builder.text(value);
      },
    );
  }
}

/// A field with a <key, value> pair, where the value is an email
abstract class RssEmailAttribute extends RssSingleAttribute {
  RssEmailAttribute({
    required super.key,
    required String email,
    required String? name,
  })  : assert(RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(email)),
        super(
          value: name?.isNotEmpty == true ? '$email ($name)' : email,
        );
}
