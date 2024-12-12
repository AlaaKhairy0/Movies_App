import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/core/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, RoutesManager.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsManager.scaffoldBg,
        child: Image.asset(
          AssetsManager.moviesLogo,
          width: 187.w,
          height: 168.h,
        ));
  }
}
