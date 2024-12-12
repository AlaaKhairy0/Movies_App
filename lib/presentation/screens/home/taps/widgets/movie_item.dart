import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/constatns_manager.dart';
import 'package:movies_app/data/model/filtered_movies_response/Results.dart';

class MovieItem extends StatelessWidget {
  MovieItem({super.key, required this.movie});

  Results movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              child: Image.network(
                '${ConstantsManager.baseNetworkImgUrl}${movie.posterPath}',
                width: 140.w,
                height: 140.h,
              )),
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
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
