import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppTheme {
  AppTheme._();

  static ThemeData light() => ThemeData(
        scaffoldBackgroundColor: AppColors.whiteF2F9F6,
        primaryColor: AppColors.primaryColor,
        fontFamily: 'LemonDays',
        colorScheme: const ColorScheme.light(
          primary: AppColors.primaryColor,
          background: AppColors.whiteF2F9F6,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          toolbarHeight: 47,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontSize: 16.0),
          titleMedium: TextStyle(color: Colors.white, fontSize: 14.0),
          titleSmall: TextStyle(color: Colors.white, fontSize: 12.0),
          bodyLarge: TextStyle(color: AppColors.primaryColor),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white,
          height: 24,
          textTheme: ButtonTextTheme.accent,
          colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(),
        outlinedButtonTheme: const OutlinedButtonThemeData(),
      );
}
