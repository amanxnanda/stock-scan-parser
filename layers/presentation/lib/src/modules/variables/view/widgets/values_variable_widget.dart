import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:stock_scan_presentation/presentation.dart';

/// {@template values_variable_widget}
/// A widget that displays the details of a [ValuesVariable].
/// {@endtemplate}
class ValuesVariableWidget extends StatelessWidget {
  /// {@macro values_variable_widget}
  const ValuesVariableWidget({super.key, required this.variable});

  /// The [ValuesVariable].
  final ValuesVariable variable;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: variable.values.length,
        padding: Spacing.medium.x,
        itemBuilder: (context, index) => Padding(
          padding: Spacing.small.top,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: Spacing.small.left,
                child: Text(variable.values[index].toString()),
              ),
              Spacing.small.yBox,
              const DottedLine(
                dashGapLength: 1.5,
                lineThickness: 2,
                dashLength: 2,
                dashColor: Colors.grey,
              ),
            ],
          ),
        ),
      );
}
