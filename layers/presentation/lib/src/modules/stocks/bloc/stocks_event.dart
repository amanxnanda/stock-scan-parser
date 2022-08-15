part of 'stocks_bloc.dart';

/// {@template stocks_event}
/// The stocks event.
/// {@endtemplate}
@immutable
abstract class StocksEvent {}

/// {@template stocks_event_fetch}
/// The event to fetch the stocks.
/// {@endtemplate}
class StocksFetched extends StocksEvent {}
