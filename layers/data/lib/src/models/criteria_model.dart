import 'package:stock_scan_data/src/models/models.dart';
import 'package:stock_scan_domain/domain.dart';

/// {@template criteria}
/// The criteria to be analyzed.
/// {@endtemplate}
class CriteriaModel extends Criteria {
  const CriteriaModel._({
    required super.type,
    required super.text,
    required super.variables,
  });

  /// {@macro criteria}
  factory CriteriaModel.fromMap(Map<String, dynamic> map) {
    final isVariable = (map['type'] as String) == 'variable';

    final type = isVariable ? CriteriaType.variable : CriteriaType.plainText;

    final variables = isVariable
        ? (map['variable'] as Map<String, dynamic>)
            .entries
            .map((e) {
              final variableMap = e.value as Map<String, dynamic>;
              final isIndicator = (variableMap['type'] as String) == 'indicator';

              return isIndicator ? IndicatorVariableModel.fromMap(e.key, variableMap) : ValuesVariableModel.fromMap(e.key, variableMap);
            })
            .cast<Variable>()
            .toList()
        : null;

    return CriteriaModel._(
      type: type,
      text: map['text'] as String,
      variables: variables,
    );
  }
}
