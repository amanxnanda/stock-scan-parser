import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_presentation/presentation.dart';
import 'package:stock_scan_presentation/src/modules/home/view/widgets/widgets.dart';

/// {@template home_view}
/// The home view.
/// {@endtemplate}
class HomeView extends StatelessWidget {
  /// {@macro home_view}
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<StocksBloc, StocksState>(
          buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
          builder: (context, state) {
            if (state is StocksLoaded) {
              return HomeBody(stocks: state.stocks);
            } else if (state is StocksError) {
              return ErrorView(message: state.message);
            }

            return const LoadingWidget();
          },
        ),
      );
}
