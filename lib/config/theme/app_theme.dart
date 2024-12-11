import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/colors_manager.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
      iconButtonTheme:  IconButtonThemeData(
          style: ButtonStyle(
            iconSize: WidgetStatePropertyAll(28.sp),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
      )),
      dividerColor: const Color(0xff707070),
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
