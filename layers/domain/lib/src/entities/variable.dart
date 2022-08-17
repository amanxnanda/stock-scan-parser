import 'package:stock_scan_domain/src/entities/entities.dart';

/// {@template variable}
/// abstract entity that represents a [Criteria] variable.
/// {@endtemplate}
abstract class Variable {
  /// {@macro variable}
  Variable({required this.id, required this.defaultValue});

  /// The id of the variable.
  final String id;

  /// The default value of the variable.
  final num defaultValue;

  /// The type of the variable.
  VariableType get type;
}
