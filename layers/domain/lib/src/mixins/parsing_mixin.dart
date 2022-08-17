import 'package:stock_scan_domain/domain.dart';

/// {@template parsing_mixin}
/// A mixin that provides parsing functionality.
/// {@endtemplate}
mixin ParsingMixin {

  /// {@macro parsing_mixin}
  List<String> parse(Criteria criteria) {
    final textList = <String>[];

    var currentString = '';

    var skip = false;

    final chars = criteria.text.split('');

    for (var i = 0; i < chars.length; i++) {
      final char = chars[i];
      if (skip) {
        textList.add('\$$char');
        skip = false;
        continue;
      }

      if (char.startsWith(r'$')) {
        textList.add(currentString);
        currentString = '';

        skip = true;
      } else {
        currentString += char;
      }

      if (i == chars.length - 1) {
        textList.add(currentString);
      }
    }

    return textList;
  }
}
