import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/constatns_manager.dart';

import '../../../../../core/routes_manager.dart';
import '../../../../../data/model/movies_response/Results.dart';

class WatchListItem extends StatelessWidget {
  WatchListItem({super.key, required this.movie});

  Results movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RoutesManager.movieDetails,
          arguments: movie),
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Stack(children: [
              SizedBox(
                width: 130.w,
                height: 150.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  child: Image.network(
                    '${ConstantsManager.baseNetworkImgUrl}${movie.posterPath}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Image.asset(
                AssetsManager.saveIcon,
                height: 36.h,
                width: 27.w,
              ),
            ]),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? '',
                    style: AppStyle.movieName,
                  ),
                  Text(
                    movie.releaseDate ?? '',
                    style: AppStyle.movieDetails,
                  ),
                  Text(
                    movie.overview ?? '',
                    style: AppStyle.movieDetails,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
