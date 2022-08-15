import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:stock_scan_presentation/presentation.dart';
import 'package:test/test.dart';

class MockStockRepository extends Mock implements StockRepository {}

void main() {
  late final StockRepository stockRepository;

  setUpAll(() {
    stockRepository = MockStockRepository();
  });

  group('GIVEN Stocks Bloc', () {
    test(
        'WHEN initialised '
        'THEN its state is [StocksInitial]', () {
      expect(
        StocksBloc(stockRepository: stockRepository).state,
        equals(const StocksInitial()),
      );
    });

    blocTest<StocksBloc, StocksState>(
      'WHEN StocksFetched is added '
      'THEN emits [StocksLoaded]',
      setUp: () {
        when(stockRepository.fetch).thenAnswer((_) async => []);
      },
      build: () => StocksBloc(stockRepository: stockRepository),
      act: (bloc) => bloc.add(StocksFetched()),
      expect: () => const <StocksState>[StocksLoaded([])],
    );

    blocTest<StocksBloc, StocksState>(
      'WHEN StocksFetched is added '
      'THEN emits [StocksError]',
      setUp: () {
        when(stockRepository.fetch).thenThrow(StocksNotFoundFailure());
      },
      build: () => StocksBloc(stockRepository: stockRepository),
      act: (bloc) => bloc.add(StocksFetched()),
      expect: () => const <StocksState>[StocksError('Stocks not found.')],
    );
  });
}
