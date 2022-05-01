/// Kotlin-like extension
extension ObjectExtensions<T extends Object> on T {
  /// Kotlin-like `let` extension
  ReturnType let<ReturnType>(ReturnType Function(T self) runnable) {
    return runnable(this);
  }
}

/// Extensions on Maps (used to encode the XML)
extension MapUtils on Map<String, String?> {
  /// Generates a new Map with only non-null values
  Map<String, String> removeNullValues() {
    Map<String, String> map = {};

    for (String key in keys) {
      String? value = this[key];

      if (value != null) {
        map[key] = this[key]!;
      }
    }

    return map;
  }
}
