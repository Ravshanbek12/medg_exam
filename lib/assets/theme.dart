import 'package:flutter/material.dart';
import 'package:medg_exam/assets/colors.dart';
import 'package:medg_exam/assets/fonts.dart';

class AppTheme {
  ThemeData darkTheme() => ThemeData();

  ThemeData lightTheme() {
    final colors = AppColors();
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.appBarBack,
      ),
      extensions: [
      ],
    );
  }
}
