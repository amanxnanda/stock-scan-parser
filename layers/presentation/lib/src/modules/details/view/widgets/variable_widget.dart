import 'package:flutter/material.dart';
import 'package:stock_scan_domain/domain.dart' as domain;
import 'package:stock_scan_presentation/presentation.dart';

/// {@template varialbe_widget}
/// A widget that displays the details of a variable.
/// {@endtemplate}
class VariableWidget extends StatelessWidget {
  /// {@macro varialbe_widget}
  const VariableWidget({super.key, required this.variable});

  /// The variable.
  final domain.Variable variable;

  @override
  Widget build(BuildContext context) => Text(
        '(${variable.defaultValue})',
        style: context.bodySmall?.copyWith(
          color: context.primaryColor,
        ),
      );
}
