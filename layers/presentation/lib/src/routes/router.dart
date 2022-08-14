import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      builder: (_, __) => const Scaffold(),
    ),
  ],
);
