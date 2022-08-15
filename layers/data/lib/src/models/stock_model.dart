import 'package:stock_scan_data/src/models/criteria_model.dart';
import 'package:stock_scan_domain/domain.dart';

/// {@template stock}
/// The stock to be analyzed.
/// {@endtemplate}
class StockModel extends Stock {
  const StockModel._({
    required super.id,
    required super.name,
    required super.tag,
    required super.color,
    required super.criterias,
  });

  /// {@macro stock}
  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel._(
      id: json['id'] as int,
      name: json['name'] as String,
      tag: json['tag'] as String,
      color: StockColor.values.firstWhere((c) => c.name == json['color'] as String),
      criterias: (json['criteria'] as List<dynamic>).map((e) => CriteriaModel.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}
