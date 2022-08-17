import 'package:flutter/material.dart';
import 'package:stock_scan_domain/domain.dart';

/// {@template variables_view}
/// A widget that displays the details of a [Variable].
class VariablesView extends StatelessWidget {
  /// {@macro variables_view}
  const VariablesView({super.key, required this.variable});

  /// The [Variable].
  final Variable variable;

  @override
  Widget build(BuildContext context) => Container();
}
