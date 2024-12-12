import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/core/strings_manager.dart';
import 'package:movies_app/presentation/screens/home/taps/widgets/film_card.dart';
import '../../../config/theme/app_style.dart';
import '../home/taps/widgets/card_description.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsManager.appbarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AssetsManager.slider),
            Padding(
              padding: REdgeInsets.only(top: 15, left: 20),
              child: Text(
                StringsManager.sliderTitle,
                style: AppStyle.textFilmDetails,
              ),
            ),
            Padding(
              padding: REdgeInsets.only(top: 5, left: 20),
              child: Text(
                StringsManager.sliderDate,
                style: AppStyle.dateSlider,
              ),
            ),
            Padding(
              padding: REdgeInsets.only(top: 18, left: 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilmCard(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: REdgeInsets.only(left: 15),
                        child: Container(
                          width: 65.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorsManager.gray2, width: 2.w),
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              'Action',
                              style: AppStyle.action,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: REdgeInsets.only(left: 14, top: 10),
                        child: Text(
                          StringsManager.descriptionFilm,
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
                              '7.7',
                              style: AppStyle.rateText,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              margin: REdgeInsets.only(bottom: 32),
              color: ColorsManager.gray2,
              width: double.infinity,
              height: 276.h,
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
                    height: 220.h,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: REdgeInsets.only(right: 13, top: 5),
                        child: Padding(
                          padding: REdgeInsets.symmetric(vertical: 6),
                          child: CardDescription(),
                        ),
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                    ),
                  ),
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
}
