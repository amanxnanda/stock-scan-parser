import 'package:stock_scan_domain/domain.dart';

/// {@template values_variable}
/// A variable that contains a list of values.
/// {@endtemplate}
class ValuesVariableModel extends ValuesVariable {
  const ValuesVariableModel._({
    required super.values,
    required super.id,
  });

  /// {@macro values_variable}
  factory ValuesVariableModel.fromJson(String id, Map<String, dynamic> json) => ValuesVariableModel._(
        id: id,
        values: json['values'] as List<int>,
      );
}
