import 'package:flutter/material.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:stock_scan_presentation/src/modules/home/view/widgets/widgets.dart';

/// {@template home_body}
/// The home body.
/// {@endtemplate}
class HomeBody extends StatelessWidget {
  /// {@macro home_body}
  const HomeBody({super.key, required this.stocks});

  /// The stocks.
  final List<Stock> stocks;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: ListView.builder(
          itemCount: stocks.length,
          itemBuilder: (_, index) => StockTile(stock: stocks[index]),
        ),
      );
}
