import 'package:stock_scan_domain/domain.dart';

/// {@template values_variable}
/// A variable that contains a list of values.
/// {@endtemplate}
class ValuesVariableModel extends ValuesVariable {
  const ValuesVariableModel._({
    required super.values,
    required super.id,
    required super.defaultValue,
  });

  /// {@macro values_variable}
  factory ValuesVariableModel.fromMap(String id, Map<String, dynamic> json) {
    final values = List.castFrom<dynamic, num>(json['values'] as List<dynamic>)..sort();
    return ValuesVariableModel._(
      id: id,
      values: values,
      defaultValue: values[1],
    );
  }
}
