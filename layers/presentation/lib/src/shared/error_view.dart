import 'package:flutter/material.dart';

/// {@template error_widget}
/// The Error widget.
/// {@endtemplate}
class ErrorView extends StatelessWidget {
  /// {@macro error_widget}
  const ErrorView({
    super.key,
    required this.message,
  });

  /// The error message.
  final String message;

  @override
  Widget build(BuildContext context) => Center(
        child: Text('Error: $message'),
      );
}
