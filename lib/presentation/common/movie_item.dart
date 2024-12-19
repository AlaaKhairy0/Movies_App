import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

import '../../core/routes_manager.dart';
import 'film_card.dart';

class MovieItem extends StatelessWidget {
  MovieItem({super.key, required this.movie});

  MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RoutesManager.movieDetails,
          arguments: movie),
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            SizedBox(
              height: 155.h,
              child: FilmCard(results: movie),
            ),
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
      ),
    );
  }
}
