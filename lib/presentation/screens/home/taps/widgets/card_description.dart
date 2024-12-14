import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/core/constatns_manager.dart';
import 'package:movies_app/data/model/movies_response/Results.dart';
import 'package:movies_app/presentation/screens/home/taps/widgets/film_card.dart';

class CardDescription extends StatefulWidget {
  CardDescription({super.key, this.results});

  Results? results;
  bool isClicked = false;

  @override
  State<CardDescription> createState() => _CardDescriptionState();
}

class _CardDescriptionState extends State<CardDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.gray,
        borderRadius: BorderRadius.all(Radius.circular(6.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.16),
            offset: const Offset(
              0.0, // Move to right 10  horizontally
              2.0, // Move to bottom 10 Vertically
            ),
            blurRadius: 3,
          ),
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
              child: Image.network(
                '${ConstantsManager.baseNetworkImgUrl}${widget.results?.posterPath}',
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
                 widget.results?.voteAverage.toString() ?? "" ,
                  style: AppStyle.textSlider,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w),
            child: Text(
              widget.results?.title.toString() ?? "" ,
              style: AppStyle.textSlider,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w),
            child: Text(
              widget.results?.releaseDate.toString() ?? "" ,
              style: AppStyle.dateSlider,
            ),
          ),
        ],
      ),
    );
  }
}
