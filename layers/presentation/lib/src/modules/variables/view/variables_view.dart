import 'package:flutter/material.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:stock_scan_presentation/src/modules/variables/view/widgets/widgets.dart';

/// {@template variables_view}
/// A widget that displays the details of a [Variable].
class VariablesView extends StatelessWidget {
  /// {@macro variables_view}
  const VariablesView({super.key, required this.variable});

  /// The [Variable].
  final Variable variable;

  Widget _toWidget() {
    switch (variable.type) {
      case VariableType.indicator:
        return IndicatorVariableWidget(variable: variable as IndicatorVariable);
      case VariableType.value:
        return ValuesVariableWidget(variable: variable as ValuesVariable);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: _toWidget(),
        ),
      );
}
