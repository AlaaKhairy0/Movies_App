import 'package:flutter/material.dart';

import 'package:movies_app/presentation/screens/movie_detailes/movie_details.dart';

import 'package:movies_app/presentation/screens/home/taps/category_details/category_details.dart';

import 'package:movies_app/presentation/screens/splash/splash.dart';

import '../presentation/screens/home/home.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String movieDetails = '/movieDetails';
  static const String categoryDetails = '/categoryDetails';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => Splash(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
      case movieDetails:
        return MaterialPageRoute(
            builder: (context) => MovieDetails(

                ),
            settings: settings);

      case categoryDetails:
        return MaterialPageRoute(
          builder: (context) => CategoryDetails(),
          settings: settings,
        );
    }
  }
}
