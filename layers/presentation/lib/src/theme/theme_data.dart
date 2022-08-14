import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The default theme data.
final kThemeData = ThemeData(
  primaryColor: Colors.blue,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: const Color(0xFF13B9FF),
  ),
  textTheme: Typography.englishLike2021.apply(
    fontSizeFactor: 1.sp,
    bodyColor: Colors.black,
  ),
);
