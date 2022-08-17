import 'package:flutter/material.dart';

/// {@template loading_widget}
/// The Loading widget.
/// {@endtemplate}
class LoadingWidget extends StatelessWidget {
  /// {@macro loading_widget}
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator.adaptive(),
      );
}
