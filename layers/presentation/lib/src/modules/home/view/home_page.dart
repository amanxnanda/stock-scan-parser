import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:stock_scan_presentation/presentation.dart';
import 'package:stock_scan_presentation/src/modules/home/view/widgets/widgets.dart';

/// {@template home_page}
/// The home page.
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => StocksCubit(
          stockRepository: context.read<StockRepository>(),
        )..fetch(),
        child: const HomeView(),
      );
}
