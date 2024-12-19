import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/core/strings_manager.dart';
import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/data_source_impl/new_releases_movies_data_source_impl.dart';
import 'package:movies_app/data/data_source_impl/recommended_movies_data_source_impl.dart';
import 'package:movies_app/data/data_source_impl/slider_movies_data_source_impl.dart';
import 'package:movies_app/data/model/movies_response/movie.dart';
import 'package:movies_app/data/repo_impl/new_releases_movies_repo_impl.dart';
import 'package:movies_app/data/repo_impl/recommended_movies_repo_impl.dart';
import 'package:movies_app/data/repo_impl/slider_movies_repo_impl.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/usecases/new_releases_movies_usecase.dart';
import 'package:movies_app/domain/usecases/recommended_movies_usecase.dart';
import 'package:movies_app/domain/usecases/slider_movies_usecase.dart';
import 'package:movies_app/presentation/common/card_description.dart';
import 'package:movies_app/presentation/common/error_state_widget.dart';
import 'package:movies_app/presentation/common/film_card.dart';
import 'package:movies_app/presentation/common/loading_state_widget.dart';
import 'package:movies_app/presentation/screens/home/taps/home/widgets/carousel_slider_widget.dart';
import 'package:movies_app/presentation/screens/home/taps/home/home_viewModel/home_viewModel.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  HomeViewModel viewModel = HomeViewModel(
      newReleasesUseCase: GetNewReleasesMoviesUseCase(
          repo: NewReleasesMoviesRepoImpl(
              dataSource:
                  NewReleasesMoviesDataSourceImpl(apiManager: ApiManager()))),
      recommendedUseCase: GetRecommendedMoviesUseCase(
          repo: RecommendedMoviesRepoImpl(
              dataSource:
                  RecommendedMoviesDataSourceImpl(apiManager: ApiManager()))),
      sliderUseCase: GetSliderMoviesUseCase(
          repo: SliderMoviesRepoImpl(
              dataSource:
                  SliderMoviesDataSourceImpl(apiManager: ApiManager()))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            children: [
              BlocProvider(
                create: (context) => HomeViewModel(
                    sliderUseCase: GetSliderMoviesUseCase(
                        repo: SliderMoviesRepoImpl(
                            dataSource: SliderMoviesDataSourceImpl(
                                apiManager: ApiManager()))),
                    recommendedUseCase: null,
                    newReleasesUseCase: null)
                  ..getMoviesSlider(),
                child: BlocBuilder<HomeViewModel, BaseState>(
                  builder: (context, state) {
                    if (state is SuccessState) {
                      List<MovieEntity> movies = state.data;
                      return CarouselSliderWidget(
                        movies: movies,
                      );
                    }
                    if (state is ErrorState) {
                      return ErrorStateWidget(
                        error: state.error,
                        serverError: state.serverError,
                      );
                    }
                    return LoadingWidget();
                  },
                ),
              ),
              Container(
                color: ColorsManager.gray2,
                width: double.infinity,
                height: 240.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: REdgeInsets.only(left: 15, top: 9, bottom: 8),
                      child: Text(
                        StringsManager.newReleases,
                        style: AppStyle.titleListView,
                      ),
                    ),
                    Container(
                      padding: REdgeInsets.only(left: 16),
                      height: 180.h,
                      child: BlocProvider(
                        create: (context) => HomeViewModel(newReleasesUseCase: GetNewReleasesMoviesUseCase(
                            repo: NewReleasesMoviesRepoImpl(
                                dataSource:
                                NewReleasesMoviesDataSourceImpl(apiManager: ApiManager()))),recommendedUseCase: null,sliderUseCase: null)..getNewReleases(),
                        child: BlocBuilder<HomeViewModel, BaseState>(
                          builder: (context, state) {
                            if (state is SuccessState) {
                              List<MovieEntity> movies = state.data;
                              return ListView.builder(
                                itemBuilder: (context, index) => Padding(
                                  padding: REdgeInsets.only(right: 13),
                                  child: FilmCard(
                                    results: movies[index],
                                  ),
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: movies.length,
                              );
                            }
                            if (state is ErrorState) {
                              return ErrorStateWidget(
                                error: state.error,
                                serverError: state.serverError,
                              );
                            }
                            return LoadingWidget();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                color: ColorsManager.gray2,
                width: double.infinity,
                height: 290.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: REdgeInsets.only(left: 15, top: 9, bottom: 8),
                      child: Text(
                        StringsManager.recomended,
                        style: AppStyle.titleListView,
                      ),
                    ),
                    Container(
                      padding: REdgeInsets.only(
                        left: 16,
                        bottom: 8,
                      ),
                      height: 240.h,
                      child: BlocProvider(
                        create: (context) => HomeViewModel(      recommendedUseCase: GetRecommendedMoviesUseCase(
                            repo: RecommendedMoviesRepoImpl(
                                dataSource:
                                RecommendedMoviesDataSourceImpl(apiManager: ApiManager()))),sliderUseCase: null,newReleasesUseCase: null)..getRecommended(),
                        child: BlocBuilder<HomeViewModel, BaseState>(
                          builder: (context, state) {
                            if (state is SuccessState) {
                              List<MovieEntity> movies = state.data;
                              return ListView.builder(
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(right: 13, top: 5.h),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: CardDescription(
                                      movie: movies[index],
                                    ),
                                  ),
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: movies.length,
                              );
                            }
                            if (state is ErrorState) {
                              return ErrorStateWidget(
                                error: state.error,
                                serverError: state.serverError,
                              );
                            }
                            return LoadingWidget();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
