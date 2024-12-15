import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/core/constatns_manager.dart';
import 'package:movies_app/core/strings_manager.dart';
import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/model/movie_details_response/MovieDetailsResponse.dart';
import 'package:movies_app/data/model/movies_response/movie.dart';
import 'package:movies_app/presentation/common/error_state_widget.dart';
import 'package:movies_app/presentation/common/film_card.dart';
import 'package:movies_app/presentation/common/loading_state_widget.dart';
import 'package:movies_app/presentation/screens/home/taps/movie_detailes/movie_details_viewModel/movie_details_viewModel.dart';

import '../../../../../../config/theme/app_style.dart';
import '../../../../../common/card_description.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    MovieDetailsViewModel viewModel = MovieDetailsViewModel();
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocProvider(
              create: (context) =>
                  viewModel..getMovieDetails(movie.id.toString()),
              child: BlocBuilder<MovieDetailsViewModel,BaseState>(builder: (context, state) {
                if(state is SuccessState){
                  MovieDetailsResponse movieDetails = state.data as MovieDetailsResponse;
                  return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                  '${ConstantsManager.baseNetworkImgUrl}${movieDetails.backdropPath}'),
                              Padding(
                                padding: REdgeInsets.only(top: 15, left: 20),
                                child: Text(
                                  movieDetails.title ?? '',
                                  style: AppStyle.textFilmDetails,
                                ),
                              ),
                              Padding(
                                padding: REdgeInsets.only(top: 5, left: 20),
                                child: Text(
                                  movieDetails.releaseDate ?? '',
                                  style: AppStyle.dateSlider,
                                ),
                              ),
                              Padding(
                                padding: REdgeInsets.only(top: 18, left: 18),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FilmCard(
                                      results: movie,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 30.h,
                                            padding: REdgeInsets.only(left: 16),
                                            child: GridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisSpacing: 8,
                                                crossAxisCount: 3,
                                                childAspectRatio: (1 / .4),
                                              ),
                                              itemCount: movieDetails.genres!.length,
                                              itemBuilder: (context, index) =>
                                                  buildMovieCategories(
                                                      movieDetails.genres![index].name ??
                                                          ''),
                                            ),
                                          ),
                                          Padding(
                                            padding: REdgeInsets.only(left: 14, top: 10),
                                            child: Text(
                                              movieDetails.overview ?? '',
                                              style: AppStyle.descriptionFilm,
                                            ),
                                          ),
                                          Padding(
                                            padding: REdgeInsets.all(14),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  AssetsManager.star,
                                                  height: 22.h,
                                                  width: 22.w,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text(
                                                  movieDetails.voteAverage.toString(),
                                                  style: AppStyle.rateText,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                }if(state is ErrorState){
                  return ErrorStateWidget();
                }return LoadingWidget();
              },),
            ),
            // FutureBuilder(
            //   future: ApiManager.getMovieDetails(movie.id.toString()),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(
            //         child: CircularProgressIndicator(
            //           color: ColorsManager.yellow,
            //         ),
            //       );
            //     }
            //     if (snapshot.hasError) {
            //       return Text(snapshot.error.toString());
            //     }
            //     MovieDetailsResponse movieDetails = snapshot.data!;
            //     return Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Image.network(
            //             '${ConstantsManager.baseNetworkImgUrl}${movieDetails.backdropPath}'),
            //         Padding(
            //           padding: REdgeInsets.only(top: 15, left: 20),
            //           child: Text(
            //             movieDetails.title ?? '',
            //             style: AppStyle.textFilmDetails,
            //           ),
            //         ),
            //         Padding(
            //           padding: REdgeInsets.only(top: 5, left: 20),
            //           child: Text(
            //             movieDetails.releaseDate ?? '',
            //             style: AppStyle.dateSlider,
            //           ),
            //         ),
            //         Padding(
            //           padding: REdgeInsets.only(top: 18, left: 18),
            //           child: Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               FilmCard(
            //                 results: movie,
            //               ),
            //               Expanded(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Container(
            //                       height: 30.h,
            //                       padding: REdgeInsets.only(left: 16),
            //                       child: GridView.builder(
            //                         physics:
            //                             const NeverScrollableScrollPhysics(),
            //                         gridDelegate:
            //                             SliverGridDelegateWithFixedCrossAxisCount(
            //                               crossAxisSpacing: 8,
            //                           crossAxisCount: 3,
            //                           childAspectRatio: (1 / .4),
            //                         ),
            //                         itemCount: movieDetails.genres!.length,
            //                         itemBuilder: (context, index) =>
            //                             buildMovieCategories(
            //                                 movieDetails.genres![index].name ??
            //                                     ''),
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: REdgeInsets.only(left: 14, top: 10),
            //                       child: Text(
            //                         movieDetails.overview ?? '',
            //                         style: AppStyle.descriptionFilm,
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: REdgeInsets.all(14),
            //                       child: Row(
            //                         children: [
            //                           Image.asset(
            //                             AssetsManager.star,
            //                             height: 22.h,
            //                             width: 22.w,
            //                           ),
            //                           SizedBox(
            //                             width: 5.w,
            //                           ),
            //                           Text(
            //                             movieDetails.voteAverage.toString(),
            //                             style: AppStyle.rateText,
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     );
            //   },
            // ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              margin: REdgeInsets.only(bottom: 32),
              color: ColorsManager.gray2,
              width: double.infinity,
              height: 305.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: REdgeInsets.only(left: 15, top: 9, bottom: 2),
                    child: Text(
                      StringsManager.moreLikeThis,
                      style: AppStyle.titleListView,
                    ),
                  ),
                  Container(
                      padding: REdgeInsets.only(left: 16),
                      height: 250.h,
                      child: FutureBuilder(
                        future:
                            ApiManager.getSimilarMovies(movie.id.toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: ColorsManager.yellow,
                              ),
                            );
                          }
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          List<Movie> movies = snapshot.data?.results ?? [];
                          return ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: REdgeInsets.only(right: 13, top: 5),
                              child: Padding(
                                padding: REdgeInsets.symmetric(vertical: 6),
                                child: CardDescription(
                                  results: movies[index],
                                ),
                              ),
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                          );
                        },
                      )),
                  SizedBox(
                    height: 12.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMovieCategories(String categoryName) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.gray2, width: 2.w),
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            categoryName,
            style: AppStyle.action,
          ),
        ),
      );
}
