import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/data/model/movies_response/Results.dart';
import 'package:movies_app/presentation/screens/home/taps/widgets/movie_item.dart';

import '../../../../../config/theme/app_style.dart';
import '../../../../../data/api_manger/api_manager.dart';

class MovieSearchDelegate extends SearchDelegate {

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith (

textTheme: const TextTheme(labelMedium: TextStyle(color: Colors.white)),
        appBarTheme: const AppBarTheme(

          color: ColorsManager.scaffoldBg,
        ),
        inputDecorationTheme:  const InputDecorationTheme(

          labelStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: ColorsManager.gray2,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(
              width: 3,
              color: ColorsManager.gray,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(
              width: 3,
              color: ColorsManager.gray,
            ),
          ),
        ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.scaffoldBg,

      ),
      child: FutureBuilder(
        future: ApiManager.search(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: ColorsManager.yellow),
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          List<Results> results = snapshot.data?.results ?? [];
          if (results.isEmpty) {
            return Center(child: Image.asset(AssetsManager.noResult,width: 120.w,height: 120.h,));
          }
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => MovieItem(
                movie: results[index],
              ),
              itemCount: results.length,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.scaffoldBg,

      ),
      child: FutureBuilder(
        future: ApiManager.search(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: ColorsManager.yellow),
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          List<Results> results = snapshot.data?.results ?? [];
          if (results.isEmpty) {
            return Center(child: Image.asset(AssetsManager.noResult,width: 120.w,height: 120.h,));
          }
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => MovieItem(
                movie: results[index],
              ),
              itemCount: results.length,
            ),
          );
        },
      ),
    );
  }
}
