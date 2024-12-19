import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/common/film_card.dart';

import '../../core/routes_manager.dart';

class CardDescription extends StatefulWidget {
  CardDescription({super.key, required this.movie});

  MovieEntity movie;
  @override
  State<CardDescription> createState() => _CardDescriptionState();
}

class _CardDescriptionState extends State<CardDescription> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RoutesManager.movieDetails,
          arguments: widget.movie),
      child: Container(
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
            SizedBox(
                width: 130.w,
                height: 130.h,
                child: FilmCard(results: widget.movie)),
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
                    widget.movie?.voteAverage.toString() ?? "",
                    style: AppStyle.textSlider,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.w),
              child: Text(
                widget.movie?.title.toString() ?? "",
                style: AppStyle.textSlider,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.w),
              child: Text(
                widget.movie?.releaseDate.toString() ?? "",
                style: AppStyle.dateSlider,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
