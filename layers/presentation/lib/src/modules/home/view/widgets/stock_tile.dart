import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:stock_scan_presentation/presentation.dart';

/// {@template stock_tile}
/// The stock tile.
/// {@endtemplate}
class StockTile extends StatelessWidget {
  /// {@macro stock_tile}
  const StockTile({super.key, required this.stock});

  /// The stock.
  final Stock stock;

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: () {},
        child: Padding(
          padding: Spacing.medium.x + Spacing.small.y,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.grey.shade600,
                    size: Spacing.tiny.value,
                  ),
                  Spacing.small.xBox,
                  Text(
                    stock.name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: Spacing.tiny.left + Spacing.small.left,
                child: Text(
                  stock.tag,
                  style: TextStyle(
                    color: stock.color.color,
                  ),
                ),
              ),
              Padding(
                padding: Spacing.tiny.left + Spacing.small.left + Spacing.tiny.top,
                child: const DottedLine(
                  dashGapLength: 1.5,
                  lineThickness: 2,
                  dashLength: 2,
                  dashColor: Colors.grey,
                ),
              ),
            ],
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
