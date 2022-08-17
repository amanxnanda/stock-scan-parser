import 'package:flutter/material.dart';
import 'package:stock_scan_domain/domain.dart';

/// {@template stock_tile}
/// The stock tile.
/// {@endtemplate}
class StockTile extends StatelessWidget {
  /// {@macro stock_tile}
  const StockTile({super.key, required this.stock});

  /// The stock.
  final Stock stock;

  @override
  Widget build(BuildContext context) => ListTile(
        minLeadingWidth: 0,
        leading: const Icon(
          Icons.circle,
          color: Colors.grey,
          size: 5,
          
        ),
        visualDensity: VisualDensity.compact,
        title: Text(
          stock.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          stock.tag,
          style: TextStyle(
            color: stock.color.color,
          ),
        ),
      );
}

extension on StockColor {
  /// Returns the color of the stock.
  Color get color {
    switch (this) {
      case StockColor.green:
        return Colors.green;
      case StockColor.red:
        return Colors.red;
    }
  }
}
