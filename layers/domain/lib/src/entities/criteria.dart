import 'package:equatable/equatable.dart';
import 'package:stock_scan_domain/src/entities/entities.dart';

/// {@template criteria}
/// The criteria to be analyzed.
/// {@endtemplate}
class Criteria extends Equatable {
  /// {@macro criteria}
  const Criteria({
    required this.type,
    required this.text,
    required this.variables,
  });

  /// The type of the criteria.
  final CriteriaType type;

  /// The text of the criteria.
  final String text;

  /// The variables of the criteria.
  final List<Variable>? variables;

  @override
  List<Object?> get props => [type, text, variables];
}
