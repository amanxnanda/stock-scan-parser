import 'package:flutter/material.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:stock_scan_presentation/presentation.dart';

/// {@template details_header}
/// A widget that displays the name and tag of a stock.
/// {@endtemplate}
class Header extends StatelessWidget {
  /// {@macro details_header}
  const Header({super.key, required this.stock});

  /// The stock.
  final Stock stock;

  @override
  Widget build(BuildContext context) => ListTile(
        tileColor: context.primaryColor,
        title: Text(stock.name),
        subtitle: Text(
          stock.tag,
          style: TextStyle(
            color: Color(stock.color.colorHash),
          ),
        ),
      );
}
