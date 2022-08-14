import 'package:flutter/material.dart';

/// {@template style}
/// The extension method on the context.
/// {@endtemplate}
extension ContextX on BuildContext {
  //  THEMES

  /// performs a simple [Theme.of(context)] action and returns given [ThemeData]
  ThemeData get theme => Theme.of(this);

  /// The primary color of the app
  Color get primaryColor => theme.primaryColor;

  /// performs a simple [Theme.of(context)] action and returns given [TextTheme]
  /// {@template text_theme_specification}
  /// ```
  /// NAME         SIZE  WEIGHT  SPACING
  /// headline1    96.0  light   -1.5
  /// headline2    60.0  light   -0.5
  /// headline3    48.0  regular  0.0
  /// headline4    34.0  regular  0.25
  /// headline5    24.0  regular  0.0
  /// headline6    20.0  medium   0.15
  /// subtitle1    16.0  regular  0.15
  /// subtitle2    14.0  medium   0.1
  /// body1        16.0  regular  0.5
  /// body2        14.0  regular  0.25
  /// button       14.0  medium   1.25
  /// caption      12.0  regular  0.4
  /// overline     10.0  regular  1.5
  /// ```
  /// {@endtemplate}
  TextTheme get textTheme => theme.textTheme;

  // TYPOGRAPHY 2021

  /// performs a simple [Theme.of(context).displayLarge] action and returns given [displayLarge]
  /// ```
  /// displayLarge        57.0  FontWeight.w400
  /// ```
  TextStyle? get displayLarge => textTheme.displayLarge;

  /// performs a simple [Theme.of(context).displayMedium] action and returns given [displayMedium]
  /// ```
  /// displayMedium       45.0  FontWeight.w400
  /// ```
  TextStyle? get displayMedium => textTheme.displayMedium;

  /// performs a simple [Theme.of(context).displaySmall] action and returns given [displaySmall]
  /// ```
  /// displaySmall        34.0  FontWeight.w400
  /// ```
  TextStyle? get displaySmall => textTheme.displaySmall;

  /// performs a simple [Theme.of(context).headlineLarge] action and returns given [headlineLarge]
  /// ```
  /// headlineLarge        32.0  FontWeight.w400
  /// ```
  TextStyle? get headlineLarge => textTheme.headlineLarge;

  /// performs a simple [Theme.of(context).headlineMedium] action and returns given [headlineMedium]
  /// ```
  /// headlineMedium       28.0  FontWeight.w400
  /// ```
  TextStyle? get headlineMedium => textTheme.headlineMedium;

  /// performs a simple [Theme.of(context).headlineSmall] action and returns given [headlineSmall]
  /// ```
  /// headlineSmall        24.0  FontWeight.w400
  /// ```
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /// performs a simple [Theme.of(context).titleLarge] action and returns given [titleLarge]
  /// ```
  /// titleLarge           22.0  FontWeight.w400
  /// ```
  TextStyle? get titleLarge => textTheme.titleLarge;

  /// performs a simple [Theme.of(context).titleMedium] action and returns given [titleMedium]
  /// ```
  /// titleMedium          16.0  FontWeight.w400
  /// ```
  TextStyle? get titleMedium => textTheme.titleMedium;

  /// performs a simple [Theme.of(context).titleSmall] action and returns given [titleSmall]
  /// ```
  /// titleSmall           14.0  FontWeight.w400
  /// ```
  TextStyle? get titleSmall => textTheme.titleSmall;

  /// performs a simple [Theme.of(context).labelLarge] action and returns given [labelLarge]
  /// ```
  /// labelLarge           14.0  FontWeight.w400
  /// ```
  TextStyle? get labelLarge => textTheme.labelLarge;

  /// performs a simple [Theme.of(context).labelMedium] action and returns given [labelMedium]
  /// ```
  /// labelMedium          12.0  FontWeight.w400
  /// ```
  TextStyle? get labelMedium => textTheme.labelMedium;

  /// performs a simple [Theme.of(context).labelSmall] action and returns given [labelSmall]
  /// ```
  /// labelSmall           11.0  FontWeight.w400
  /// ```
  TextStyle? get labelSmall => textTheme.labelSmall;

  /// performs a simple [Theme.of(context).bodyLarge] action and returns given [bodyLarge]
  /// ```
  /// bodyLarge            16.0  FontWeight.w400
  /// ```
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  /// performs a simple [Theme.of(context).bodyMedium] action and returns given [bodyMedium]
  /// ```
  /// bodyMedium           14.0  FontWeight.w400
  /// ```
  TextStyle? get bodyMedium => textTheme.bodyMedium;

  /// performs a simple [Theme.of(context).bodySmall] action and returns given [bodySmall]
  /// ```
  /// bodySmall            12.0  FontWeight.w400
  /// ```
  TextStyle? get bodySmall => textTheme.bodySmall;
}
