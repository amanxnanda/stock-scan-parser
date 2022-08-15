import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stock_scan_domain/domain.dart';

part 'stocks_event.dart';
part 'stocks_state.dart';

/// {@template stocks_bloc}
/// The stocks bloc.
/// {@endtemplate}
class StocksBloc extends Bloc<StocksEvent, StocksState> {
  /// {@macro stocks_bloc}
  StocksBloc({
    required StockRepository stockRepository,
  })  : _stockRepository = stockRepository,
        super(const StocksInitial()) {
    on<StocksFetched>(_onFetched);
  }

  final StockRepository _stockRepository;

  Future<void> _onFetched(StocksFetched event, Emitter<StocksState> emit) async {
    try {
      final stocks = await _stockRepository.fetch();

      emit(StocksLoaded(stocks));
    } catch (e) {
      emit(StocksError(e.toString()));
    }
  }
}
