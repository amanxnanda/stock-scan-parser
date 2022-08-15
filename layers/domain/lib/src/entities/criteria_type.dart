import 'package:stock_scan_domain/src/entities/entities.dart';

/// {@template criteria_type}
/// The type of a criteria.
/// {@endtemplate}
enum CriteriaType {
  /// Plain text.
  plainText,

  /// A combination of [Variable]s.
  variable,
}
