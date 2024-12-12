import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/splash/splash.dart';

import '../presentation/screens/home/home.dart';

class RoutesManager{
  static const String splash = '/splash';
  static const String home = '/home';
  static Route? router(RouteSettings settings){
    switch(settings.name){
      case splash:
        return MaterialPageRoute(builder: (context) => Splash(),);
      case home:
        return MaterialPageRoute(builder: (context) => Home(),);
    }
  }
}