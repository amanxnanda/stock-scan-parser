import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_scan_data/data.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:stock_scan_presentation/presentation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => RepositoryProvider<StockRepository>(
        create: (_) => StockRepositoryImpl(),
        child: ScreenUtilInit(
          builder: (_, __) => MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            routeInformationProvider: router.routeInformationProvider,
            theme: kThemeData,
            themeMode: ThemeMode.dark,
          ),
        ),
      );
}
