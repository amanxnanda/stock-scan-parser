import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stock_scan_domain/domain.dart';

part 'stocks_state.dart';

/// {@template stocks_cubit}
/// The stocks cubit.
/// {@endtemplate}
class StocksCubit extends Cubit<StocksState> {
  /// {@macro stocks_cubit}
  StocksCubit({
    required StockRepository stockRepository,
  })  : _stockRepository = stockRepository,
        super(const StocksInitial());

  final StockRepository _stockRepository;

  /// Fetches the stocks.
  Future<void> fetch() async {
    try {
      final stocks = await _stockRepository.fetch();

      emit(StocksLoaded(stocks));
    } catch (e) {
      emit(StocksError(e.toString()));
    }
  }
}
