class PatternMatcher {
  /// Converts wildcard syntax to RegExp:
  /// `*` => any chars, all other regex metacharacters are treated literally.
  static RegExp wildcardToRegExp(String pattern, {bool caseSensitive = true}) {
    final buffer = StringBuffer();
    for (final rune in pattern.runes) {
      final ch = String.fromCharCode(rune);
      if (ch == '*') {
        buffer.write('.*');
      } else {
        buffer.write(RegExp.escape(ch));
      }
    }
    return RegExp(buffer.toString(), caseSensitive: caseSensitive);
  }
}
