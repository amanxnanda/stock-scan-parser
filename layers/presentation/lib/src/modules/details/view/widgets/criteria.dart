import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_scan_domain/domain.dart' as domain;
import 'package:stock_scan_presentation/presentation.dart';

/// {@template details_criteria}
/// A widget that displays the details of a criteria.
/// {@endtemplate}
class Criteria extends StatefulWidget {
  /// {@macro details_criteria}
  const Criteria({super.key, required this.criteria});

  /// The criteria.
  final domain.Criteria criteria;

  @override
  State<Criteria> createState() => _CriteriaState();
}

class _CriteriaState extends State<Criteria> with domain.ParsingMixin {
  domain.Variable _getVariable(String id) => widget.criteria.variables!.firstWhere(
        (variable) => variable.id == id,
      );

  TextSpan _toSpan(domain.Variable variable) => TextSpan(
        text: '(${variable.defaultValue})',
        style: context.bodySmall?.copyWith(
          color: context.primaryColor,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () => context.pushNamed(
                RouteNames.variables,
                extra: variable,
              ),
      );

  RichText _convertToText() {
    final children = <TextSpan>[];

    for (final word in parse(widget.criteria)) {
      if (word.startsWith(r'$')) {
        children.add(_toSpan(_getVariable(word)));
      } else {
        children.add(TextSpan(text: word));
      }
    }

    return RichText(
      text: TextSpan(children: children),
    );
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: Spacing.small.y,
        child: _convertToText(),
      );
}
