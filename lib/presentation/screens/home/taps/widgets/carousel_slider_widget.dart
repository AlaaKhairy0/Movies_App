import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/core/strings_manager.dart';
import 'package:movies_app/presentation/screens/home/taps/widgets/film_card.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 15,
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
                    Image.asset(AssetsManager.slider),
                  ],
                ),
              ),
              Positioned(top: 100.h, left: 20.w, child: FilmCard()),
              Positioned(
                  top: 230.h,
                  left: 180.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringsManager.sliderTitle,
                        style: AppStyle.textSlider,
                      ),
                      Text(
                        StringsManager.sliderDate,
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
