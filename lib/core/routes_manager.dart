import 'package:flutter/material.dart';

import 'package:movies_app/presentation/screens/home/taps/category_details/category_details_view/category_details_view.dart';

import 'package:movies_app/presentation/screens/splash/splash.dart';

import '../presentation/screens/home/home.dart';
import '../presentation/screens/home/taps/movie_detailes/movie_details_view/movie_details_view.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String movieDetails = '/movieDetails';
  static const String categoryDetails = '/categoryDetails';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case movieDetails:
        return MaterialPageRoute(
          builder: (context) => const MovieDetailsView(),
          settings: settings,
        );

      case categoryDetails:
        return MaterialPageRoute(
          builder: (context) => const CategoryDetailsView(),
          settings: settings,
        );
    }
  }
}
