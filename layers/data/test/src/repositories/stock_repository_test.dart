import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:stock_scan_data/data.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:test/test.dart';

import '../../mock_data.dart';

class MockClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('Stock Repository', () {
    late http.Client httpClient;
    late StockRepository stockRepository;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockClient();
      stockRepository = StockRepositoryImpl(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(StockRepositoryImpl(), isNotNull);
      });
    });

    group('fetch', () {
      test('makes correct http request', () async {
        final response = MockResponse();

        when(() => response.statusCode).thenReturn(200);

        when(() => response.body).thenReturn('[]');

        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        try {
          await stockRepository.fetch();
        } catch (_) {}

        verify(
          () => httpClient.get(
            Uri.https(
              'mobile-app-challenge.herokuapp.com',
              '/data',
            ),
          ),
        ).called(1);
      });

      test('throws StocksFetchRequestFailure on non-200 response', () async {
        final response = MockResponse();

        when(() => response.statusCode).thenReturn(400);

        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        expect(
          // ignore: unnecessary_await_in_return
          () async => await stockRepository.fetch(),
          throwsA(isA<StocksFetchRequestFailure>()),
        );
      });

      test('throws StocksNotFoundFailure on empty response', () async {
        final response = MockResponse();

        when(() => response.statusCode).thenReturn(200);

        when(() => response.body).thenReturn('[]');

        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        expect(
          // ignore: unnecessary_await_in_return
          () async => await stockRepository.fetch(),
          throwsA(isA<StocksNotFoundFailure>()),
        );
      });

      test('returns list of stocks', () async {
        final response = MockResponse();

        when(() => response.statusCode).thenReturn(200);

        when(() => response.body).thenReturn(mockData);

        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        final actual = await stockRepository.fetch();

        expect(
          actual,
          isA<List<Stock>>().having(
            (ls) => ls[0],
            'First Stock',
            isA<Stock>()
                .having(
                  (s) => s.id,
                  'ID',
                  1,
                )
                .having(
                  (s) => s.name,
                  'Name',
                  'Top gainers',
                )
                .having(
                  (s) => s.tag,
                  'Tag',
                  'Intraday Bullish',
                )
                .having(
                  (s) => s.color,
                  'Color',
                  StockColor.green,
                )
                .having(
                  (s) => s.criterias,
                  'Criteria',
                  isA<List<Criteria>>().having(
                    (lc) => lc[0],
                    'First Criteria',
                    isA<Criteria>()
                        .having(
                          (c) => c.type,
                          'Type',
                          CriteriaType.plainText,
                        )
                        .having(
                          (c) => c.text,
                          'Text',
                          'Sort - %price change in descending order',
                        ),
                  ),
                ),
          ),
        );
      });
    });
  });
}
