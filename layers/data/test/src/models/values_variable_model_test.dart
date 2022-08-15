import 'dart:convert';

import 'package:stock_scan_data/src/models/models.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:test/test.dart';

import '../../mock_data.dart';

void main() {
  group('Values Variable Model', () {
    test(
        'GIVEN a raw json object '
        'WHEN fromMap called '
        'THEN create an instance of ValuesVariable', () {
      final map = jsonDecode(valuesVariableMockJson) as Map<String, dynamic>;

      expect(
        ValuesVariableModel.fromMap(r'$1', map),
        isA<ValuesVariable>().having((i) => i.id, 'ID', r'$1').having(
          (i) => i.values,
          'Values',
          [1.5, 0.5, 1, 2, 3],
        ),
      );
    });
  });
}
