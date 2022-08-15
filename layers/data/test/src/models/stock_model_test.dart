import 'dart:convert';

import 'package:stock_scan_data/src/models/stock_model.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:test/test.dart';

import '../../mock_data.dart';

void main() {
  group('Stock', () {
    test(
        'GIVEN a raw json object '
        'WHEN fromMap called '
        'THEN create an instance of Stock', () {
      final map = jsonDecode(stockMockData) as Map<String, dynamic>;

      final stock = StockModel.fromMap(map);

      expect(
        stock,
        isA<Stock>()
            .having(
              (s) => s.id,
              'ID',
              5,
            )
            .having(
              (s) => s.name,
              'Name',
              'RSI Overbought',
            )
            .having(
              (s) => s.tag,
              'Tag',
              'Bearish',
            )
            .having(
              (s) => s.color,
              'Color',
              isA<StockColor>().having(
                (sc) => sc,
                'Color Value',
                StockColor.red,
              ),
            )
            .having(
              (s) => s.criterias[0],
              'First Criteria',
              isA<Criteria>()
                  .having(
                    (i) => i.type,
                    'Type',
                    CriteriaType.plainText,
                  )
                  .having(
                    (i) => i.text,
                    'Text',
                    'Sort - %price change in descending order',
                  )
                  .having(
                    (i) => i.variables,
                    'Variables',
                    isNull,
                  ),
            )
            .having(
              (s) => s.criterias[1],
              'Second Criteria',
              isA<Criteria>()
                  .having(
                    (i) => i.type,
                    'Type',
                    CriteriaType.variable,
                  )
                  .having(
                    (i) => i.text,
                    'Text',
                    r'Today’s open < yesterday’s low by $1 %',
                  )
                  .having(
                    (i) => i.variables![0],
                    'First Variable',
                    isA<ValuesVariable>().having((i) => i.id, 'ID', r'$1').having(
                      (i) => i.values,
                      'Values',
                      [-3, -1, -2, -5, -10],
                    ),
                  )
                  .having(
                    (i) => i.variables![1],
                    'Second Variable',
                    isA<ValuesVariable>().having((i) => i.id, 'ID', r'$2').having(
                      (i) => i.values,
                      'Values',
                      [1.5, 0.5, 1, 2, 3],
                    ),
                  )
                  .having(
                    (i) => i.variables![2],
                    'Third Variable',
                    isA<IndicatorVariable>()
                        .having(
                          (i) => i.id,
                          'ID',
                          r'$3',
                        )
                        .having(
                          (i) => i.studyType,
                          'Study Type',
                          isA<StudyType>().having(
                            (s) => s,
                            'Study Type Value',
                            StudyType.rsi,
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
                          14,
                        ),
                  ),
            ),
      );
    });
  });
}
