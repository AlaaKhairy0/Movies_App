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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AssetsManager.slider),
            Padding(
              padding: EdgeInsets.only(top: 15.h, left: 20.w),
              child: Text(
                StringsManager.sliderTitle,
                style: AppStyle.textFilmDetails,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h, left: 20.w),
              child: Text(
                StringsManager.sliderDate,
                style: AppStyle.dateSlider,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.h, left: 18.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilmCard(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Container(
                          width: 65.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorsManager.gray2, width: 2.w),
                            borderRadius: BorderRadius.circular(8),
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
                      padding:  EdgeInsets.only(left: 14.w,top: 10.h
                      ),
                      child: Text(StringsManager.descriptionFilm,style: AppStyle.descriptionFilm,),
                    ),
                      Padding(
                        padding: const EdgeInsets.all(14),
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
          SizedBox(height: 15.h,),
            Container(
              color: ColorsManager.gray,
              width: double.infinity,
              height: 255.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, top: 9.h,bottom: 8.h),
                    child: Text(
                      StringsManager.moreLikeThis,
                      style: AppStyle.titleListView,
                    ),
                  ),
                  SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding:  EdgeInsets.only(right: 13,top: 5.h),
                        child: CardDescription(),
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                    ),
                  ),
                  SizedBox(height: 12.h,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
