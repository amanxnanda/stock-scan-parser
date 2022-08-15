import 'package:stock_scan_domain/domain.dart';

/// {@template indicator_variable}
/// The variable to be analyzed.
/// {@endtemplate}
class IndicatorVariableModel extends IndicatorVariable {
  const IndicatorVariableModel._({
    required super.id,
    required super.studyType,
    required super.parameterName,
    required super.minValue,
    required super.maxValue,
    required super.defaultValue,
  });

  /// {@macro indicator_variable}
  factory IndicatorVariableModel.fromJson(String id, Map<String, dynamic> json) {
    return IndicatorVariableModel._(
      id: id,
      studyType: StudyType.values.firstWhere(
        (StudyType value) => value.name == json['study_type'] as String,
      ),
      parameterName: json['parameter_name'] as String,
      minValue: json['min_value'] as int,
      maxValue: json['max_value'] as int,
      defaultValue: json['default_value'] as int,
    );
  }
}
