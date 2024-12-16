import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/data/model/movies_response/movie.dart';
import 'package:movies_app/presentation/common/error_state_widget.dart';
import 'package:movies_app/presentation/common/loading_state_widget.dart';
import 'package:movies_app/presentation/common/movie_item.dart';
import 'package:movies_app/presentation/screens/home/taps/search/search_viewModel.dart';

class MovieSearchDelegate extends SearchDelegate {
  final SearchViewModel viewModel;

  MovieSearchDelegate(this.viewModel);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
      textTheme: const TextTheme(labelMedium: TextStyle(color: Colors.white)),
      appBarTheme: const AppBarTheme(
        color: ColorsManager.scaffoldBg,
      ),
      inputDecorationTheme: const InputDecorationTheme(
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
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null); // Close the search delegate
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    viewModel.searchMovies(query);
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    viewModel.searchMovies(query);
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    return BlocBuilder<SearchViewModel, BaseState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingState) {
          return  LoadingWidget();
        } else if (state is SuccessState) {
          List<Movie> movies = state.data;
          if (movies.isEmpty) {
            return Center(
              child: Image.asset(
                AssetsManager.noResult,
                width: 120.w,
                height: 120.h,
              ),
            );
          }
          return ListView.separated(
            padding: REdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) => MovieItem(movie: movies[index]),
            itemCount: movies.length,
          );
        } else if (state is ErrorState) {
          return ErrorStateWidget(
            serverError: state.serverError,
            error: state.error,
          );
        }
        return  LoadingWidget();
      },
    );
  }
}
