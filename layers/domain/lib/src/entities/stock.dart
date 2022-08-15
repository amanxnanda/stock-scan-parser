import 'package:equatable/equatable.dart';
import 'package:stock_scan_domain/src/entities/entities.dart';

/// {@template stock}
/// The stock to be analyzed.
/// {@endtemplate}
class Stock extends Equatable implements Comparable<Stock> {
  /// {@macro stock}
  const Stock({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criterias,
  });

  /// The id of the stock.
  final int id;

  /// The name of the stock.
  final String name;

  /// The tag of the stock.
  final String tag;

  /// The color of the stock.
  final StockColor color;

  /// The criterias of the stock.
  final List<Criteria> criterias;

  @override
  List<Object> get props => [
        id,
        name,
        tag,
        color,
        criterias,
      ];

  @override
  int compareTo(Stock other) => id.compareTo(other.id);
}
