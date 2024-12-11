import 'package:flutter/material.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/colors_manager.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
      appBarTheme: AppBarTheme(
        color: ColorsManager.bottomNavBg,
        centerTitle: true,
      elevation: 0,
        titleTextStyle: AppStyle.appBar,

      ),
      scaffoldBackgroundColor: ColorsManager.scaffoldBg,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.bottomNavBg,
        selectedItemColor: ColorsManager.yellow,
        unselectedItemColor: ColorsManager.unSelected,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppStyle.bottomNavLabel,
        unselectedLabelStyle: AppStyle.bottomNavLabel,
      ));
  static ThemeData light = ThemeData();
}
