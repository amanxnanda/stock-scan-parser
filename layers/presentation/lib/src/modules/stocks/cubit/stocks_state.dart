part of 'stocks_cubit.dart';

/// {@template stocks_state}
/// The stocks state.
/// {@endtemplate}
@immutable
abstract class StocksState extends Equatable {
  /// {@macro stocks_state}
  const StocksState();
}

/// {@template stocks_initial}
/// The initial stocks state.
/// {@endtemplate}
class StocksInitial extends StocksState {
  /// {@macro stocks_initial}
  const StocksInitial();

  @override
  List<Object> get props => [];
}

/// {@template stocks_loaded}
/// The stocks state when loaded.
/// {@endtemplate}
class StocksLoaded extends StocksState {
  /// {@macro stocks_loaded}
  const StocksLoaded(this.stocks);

  /// The stocks.
  final List<Stock> stocks;

  @override
  List<Object> get props => [stocks];
}

/// {@template stocks_error}
/// The stocks state when an error occurs.
/// {@endtemplate}
class StocksError extends StocksState {
  /// {@macro stocks_error}
  const StocksError(this.message);

  /// The error message.
  final String message;

  @override
  List<Object> get props => [message];
}
