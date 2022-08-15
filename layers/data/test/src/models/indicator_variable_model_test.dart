import 'dart:convert';

import 'package:stock_scan_data/src/models/indicator_variable_model.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:test/test.dart';

import '../../mock_data.dart';

void main() {
  group('Indicator Variable Model', () {
    test(
      'GIVEN a raw json object '
      'WHEN fromMap called '
      'THEN create an instance of IndicatorVariable',
      () {
        final map = jsonDecode(indicatorVariableMockJson) as Map<String, dynamic>;

        expect(
          IndicatorVariableModel.fromMap(r'$1', map),
          isA<IndicatorVariable>()
              .having((i) => i.id, 'ID', r'$1')
              .having(
                (i) => i.studyType,
                'Study Type',
                isA<StudyType>().having(
                  (s) => s,
                  'Study Type Value',
                  StudyType.cci,
                ),
              )
              .having(
                (i) => i.parameterName,
                'Parameter Name',
                'period',
              )
              .having(
                (i) => i.minValue,
                'Min Value',
                1,
              )
              .having(
                (i) => i.maxValue,
                'Max Value',
                99,
              )
              .having(
                (i) => i.defaultValue,
                'Default Value',
                20,
              ),
        );
      },
    );
  });
}
