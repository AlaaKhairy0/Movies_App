import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/core/constatns_manager.dart';
import 'package:movies_app/core/strings_manager.dart';
import 'package:movies_app/data/model/movies_response/Results.dart';
import 'package:movies_app/presentation/screens/home/taps/widgets/film_card.dart';

class CarouselSliderWidget extends StatelessWidget {
  CarouselSliderWidget({super.key, required this.movies});
  List<Results> movies ;
  Results? results;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(

      itemCount: movies.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Column(
        children: [
          Stack(
            children: [
              Container(
                width: 412.w,
                height: 294.h,
                color: ColorsManager.scaffoldBg,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                        '${ConstantsManager.baseNetworkImgUrl}${movies[itemIndex]?.backdropPath}',),
                  ],
                ),
              ),
              Positioned(
                  top: 100.h,
                  left: 20.w,
                  child: FilmCard(
                    results: movies[itemIndex],
                  )),
              Positioned(
                  top: 230.h,
                  left: 180.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movies[itemIndex]?.title ?? "",
                        style: AppStyle.textSlider,
                      ),
                      Text(
                        movies[itemIndex]?.releaseDate ?? "",
                        style: AppStyle.dateSlider,
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
      options: CarouselOptions(
        height: 335.h,
        autoPlay: true,
        //enlargeCenterPage: true,
        viewportFraction: 1.0,
        initialPage: 0,
      ),
    );
  }
}
