import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';

class WatchlistItem extends StatelessWidget {
  const WatchlistItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              child: Image.asset(
                AssetsManager.categoryItem,
                width: 140.w,
                height: 89.h,
              )),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alita Battle Angel',
                style: AppStyle.movieName,
              ),
              Text(
                '2019',
                style: AppStyle.movieDetails,
              ),
              Text(
                'Rosa Salazar, Christoph Waltz',
                style: AppStyle.movieDetails,
              ),
            ],
          )
        ],
      ),
    );
  }
}
