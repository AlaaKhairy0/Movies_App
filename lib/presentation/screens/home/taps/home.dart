import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/core/strings_manager.dart';
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
              CarouselSliderWidget(),
              Container(
                color: ColorsManager.gray,
                width: double.infinity,
                height: 200.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.w, top: 9.h,bottom: 8.h),
                      child: Text(
                        StringsManager.newReleases,
                        style: AppStyle.titleListView,
                      ),
                    ),
                    SizedBox(
                      height: 150.h,
                      child: ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding:  EdgeInsets.only(right: 13),
                          child: FilmCard(),
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.h,),
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
                        StringsManager.recomended,
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
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }
}
