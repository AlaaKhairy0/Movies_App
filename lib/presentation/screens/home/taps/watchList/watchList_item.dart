import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              child: Image.asset(
                AssetsManager.categoryItem,
                width: 140.w,
                height: 140.h,
              )),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'mmmmm',
                style: AppStyle.movieName,
              ),
              Text(
                'mmmmmmm',
                style: AppStyle.movieDetails,
              ),
              Text(
                'mmmmm',
                style: AppStyle.movieDetails,
              ),
            ],
          )
        ],
      ),
    );
  }
}
