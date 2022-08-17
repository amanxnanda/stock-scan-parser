import 'package:flutter/material.dart';
import 'package:stock_scan_domain/domain.dart';

/// {@template indicator_variable_widget}
/// A widget that displays the details of a [IndicatorVariable].
/// {@endtemplate}
class IndicatorVariableWidget extends StatelessWidget {

  /// {@macro indicator_variable_widget}
  const IndicatorVariableWidget({super.key, required this.variable});

  /// The [IndicatorVariable].
  final IndicatorVariable variable;

  @override
  Widget build(BuildContext context) => Container();
}
