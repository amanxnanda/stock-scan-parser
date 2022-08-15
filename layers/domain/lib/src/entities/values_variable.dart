import 'package:equatable/equatable.dart';
import 'package:stock_scan_domain/src/entities/entities.dart';

/// {@template values_variable}
/// A variable that contains a list of values.
/// {@endtemplate}
class ValuesVariable extends Equatable implements Variable {
  /// {@macro values_variable}
  const ValuesVariable({
    required this.values,
    required this.id,
  });

  /// id
  final String id;

  /// values
  final List<num> values;

  @override
  VariableType get type => VariableType.value;

  @override
  List<Object> get props => [id, values];
}
