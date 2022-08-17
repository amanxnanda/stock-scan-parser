import 'package:flutter/material.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:stock_scan_presentation/presentation.dart';
import 'package:stock_scan_presentation/src/modules/details/view/widgets/widgets.dart';

/// {@template detials_view}
/// A widget that displays the details of a stock.
/// {@endtemplate}
class DetailsView extends StatelessWidget {
  /// {@macro detials_view}
  const DetailsView({super.key, required this.stock});

  /// The stock.
  final Stock stock;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          minimum: Spacing.medium.all,
          child: Column(
            children: [
              DetailsHeader(stock: stock),
              Expanded(child: ListView()),
            ],
          ),
        ),
      );
}
