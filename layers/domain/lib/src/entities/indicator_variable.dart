import 'package:equatable/equatable.dart';
import 'package:stock_scan_domain/src/entities/entities.dart';

/// {@template indicator_variable}
/// The variable to be analyzed.
/// {@endtemplate}
class IndicatorVariable extends Equatable implements Variable {
  /// {@macro indicator_variable}
  const IndicatorVariable({
    required this.id,
    required this.studyType,
    required this.parameterName,
    required this.minValue,
    required this.maxValue,
    required this.defaultValue,
  });

  /// The id of the variable.
  @override
  final String id;

  /// The type of the study.
  final StudyType studyType;

  /// The name of the parameter.
  final String parameterName;

  /// The minimum value of the parameter.
  final int minValue;

  /// The maximum value of the parameter.
  final int maxValue;

  /// The default value of the parameter.
  @override
  final int defaultValue;

  @override
  VariableType get type => VariableType.value;

  @override
  List<Object> get props => [
        id,
        studyType,
        parameterName,
        minValue,
        maxValue,
        defaultValue,
      ];
}
