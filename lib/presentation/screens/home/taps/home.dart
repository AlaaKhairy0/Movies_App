import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/core/strings_manager.dart';
import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/model/movies_response/Results.dart';
import 'package:movies_app/presentation/screens/home/taps/widgets/card_description.dart';
import 'package:movies_app/presentation/screens/home/taps/widgets/film_card.dart';
import 'package:movies_app/presentation/screens/home/taps/widgets/carousel_slider_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            children: [
              FutureBuilder(
                future: ApiManager.getMoviesSlider(),
                builder: (BuildContext context,
                    AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: ColorsManager.yellow,);
                  }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  List<Results> movies = snapshot.data.results
                      ?? [];
                  return CarouselSliderWidget(movies: movies,);
                },
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
                      child: FutureBuilder(
                          future: ApiManager.getNewReleases(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState
                                .waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: ColorsManager.yellow,),
                              );
                            }
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            }
                            List<Results> movies = snapshot.data?.results
                                ?? [];
                            return ListView.builder(

                              itemBuilder: (context, index) =>
                                  Padding(
                                    padding: REdgeInsets.only(right: 13),
                                    child: FilmCard(results: movies[index],),
                                  ),
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                            );

                            ;
                          }

                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.h,),
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
                      padding: REdgeInsets.only(left: 16, bottom: 8,),
                      height: 240.h,
                      child: FutureBuilder(
                        future: ApiManager.getRecommended(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState
                              .waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: ColorsManager.yellow,),
                            );
                          }
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          List<Results> movies = snapshot.data?.results
                              ?? [];
                          return ListView.builder(
                            itemBuilder: (context, index) =>
                                Padding(
                                  padding: EdgeInsets.only(right: 13, top: 5.h),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6),
                                    child: CardDescription(results: movies[index],),
                                  ),
                                ),
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                          );

                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.h,)
            ],
          ),
        ),
      ),
    );
  }
}