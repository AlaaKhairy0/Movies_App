import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/presentation/screens/home/taps/widgets/film_card.dart';

class CardDescription extends StatefulWidget {
  CardDescription({super.key});

  bool isClicked = false;

  @override
  State<CardDescription> createState() => _CardDescriptionState();
}

class _CardDescriptionState extends State<CardDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.gray2,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff514F4F).withOpacity(.5),

            offset: Offset(
              2.0, // Move to right 10  horizontally
              2.0, // Move to bottom 10 Vertically

            ),
          )
        ],
      ),
      height: 194.h,
      width: 130.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            SizedBox(
              width: 130.w,
              height: 130.h,
              child: Image.asset(
                AssetsManager.spider,
                fit: BoxFit.fill,
              ),
            ),
            GestureDetector(
                onTap: () {
                  widget.isClicked = !widget.isClicked;
                  setState(() {});
                },
                child: Image.asset(
                  widget.isClicked
                      ? AssetsManager.saveIcon
                      : AssetsManager.unSaveIcon,
                  height: 36.h,
                  width: 27.w,
                )),
          ]),
          Padding(
            padding: EdgeInsets.only(top: 8.h, left: 8.w),
            child: Row(
              children: [
                Image.asset(
                  AssetsManager.star,
                  height: 14.h,
                  width: 14.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '7.7',
                  style: AppStyle.textSlider,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w),
            child: Text(
              'Deadpool 2',
              style: AppStyle.textSlider,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w),
            child: Text(
              '2018  R  1h 59m',
              style: AppStyle.dateSlider,
            ),
          ),
        ],
      ),
    );
  }
}