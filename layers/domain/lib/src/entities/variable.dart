import 'package:stock_scan_domain/src/entities/entities.dart';

/// {@template variable}
/// abstract entity that represents a [Criteria] variable.
/// {@endtemplate}
abstract class Variable {
  /// The type of the variable.
  VariableType get type;
}
