import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:stock_scan_presentation/presentation.dart';

/// {@template indicator_variable_widget}
/// A widget that displays the details of a [IndicatorVariable].
/// {@endtemplate}
class IndicatorVariableWidget extends StatelessWidget {
  /// {@macro indicator_variable_widget}
  const IndicatorVariableWidget({super.key, required this.variable});

  /// The [IndicatorVariable].
  final IndicatorVariable variable;

  String? _inputValidator(String? value) {
    if (value == null) {
      return null;
    } else if ((int.tryParse(value) ?? variable.defaultValue) > variable.maxValue || (int.tryParse(value) ?? variable.defaultValue) < variable.minValue) {
      return 'Value must be between ${variable.minValue} and ${variable.maxValue}';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: Spacing.medium.x,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              variable.studyType.label,
              style: context.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacing.small.yBox,
            Text(
              'Set Parameters',
              style: context.titleMedium,
            ),
            Spacing.small.yBox,
            Container(
              color: Colors.white,
              padding: Spacing.small.all,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    variable.parameterName,
                    style: context.titleSmall?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Spacing.small.xBox,
                  Flexible(
                    child: TextFormField(
                      autofocus: true,
                      style: const TextStyle(color: Colors.black),
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: _inputValidator,
                      initialValue: variable.defaultValue.toString(),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.all(4),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
