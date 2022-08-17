import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:go_router/go_router.dart';
import 'package:stock_scan_domain/domain.dart';
import 'package:stock_scan_presentation/presentation.dart';

/// {@template router}
/// The router of the application.
/// {@endtemplate}
final GoRouter router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  urlPathStrategy: UrlPathStrategy.path,
  routes: [
    GoRoute(
      name: RouteNames.root,
      path: '/',
      builder: (_, __) => const HomePage(),
      routes: [
        GoRoute(
          name: RouteNames.details,
          path: 'details',
          builder: (_, state) => DetailsView(
            stock: state.extra! as Stock,
          ),
          routes: [
            GoRoute(
              name: RouteNames.variables,
              path: 'variables',
              builder: (_, state) => VariablesView(
                variable: state.extra! as Variable,
              ),
             
            ),
          ],
        ),
      ],
    ),
  ],
);
