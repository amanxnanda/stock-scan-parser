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

  group('GIVEN Stocks Cubit', () {
    test(
        'WHEN initialised '
        'THEN emits [StocksInitial]', () {
      expect(
        StocksCubit(stockRepository: stockRepository).state,
        equals(const StocksInitial()),
      );
    });

    test(
        "WHEN [StockRepository]'s fetch throws an exception "
        'THEN emits [StocksError]', () {
      when(stockRepository.fetch).thenThrow(StocksNotFoundFailure());

      final cubit = StocksCubit(stockRepository: stockRepository)..fetch();

      expect(cubit.state, const StocksError('Stocks not found.'));
    });

    blocTest<StocksCubit, StocksState>(
      "WHEN [StockRepository]'s fetch returns stocks "
      'THEN emits [StocksLoaded]',
      setUp: () {
        when(stockRepository.fetch).thenAnswer((_) async => []);
      },
      build: () => StocksCubit(stockRepository: stockRepository)..fetch(),
      expect: () => const <StocksState>[StocksLoaded([])],
    );
  });
}
