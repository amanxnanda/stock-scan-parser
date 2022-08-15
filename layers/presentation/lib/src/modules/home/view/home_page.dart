import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:stock_scan_presentation/src/modules/home/view/widgets/widgets.dart';
import 'package:stock_scan_presentation/src/modules/stocks/bloc/stocks_bloc.dart';

/// {@template home_page}
/// The home page.
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => StocksBloc(
          stockRepository: context.read<StockRepository>(),
        ),
        child: const HomeView(),
      );
}
