import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/model/categories_response/genre.dart';
import 'package:movies_app/data/model/movies_response/movie.dart';
import '../../../../common/movie_item.dart';

class CategoryDetails extends StatelessWidget {
   const CategoryDetails({super.key,});
  //Genres category;
  @override
  Widget build(BuildContext context) {
    Genre category = ModalRoute.of(context)!.settings.arguments as Genre;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(category.name??'',style: AppStyle.tabHeader,),
        centerTitle: true,
      ),
      body: FutureBuilder(future: ApiManager.getMoviesByCategory(category.id.toString()), builder: (context, snapshot) {
        List<Movie> movies = snapshot.data?.results ?? [];
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) => MovieItem(movie: movies[index],),
              separatorBuilder: (context, index) => const Divider(
                height: 1,
              ),
              itemCount: movies.length),
        );
      },)
    );
  }
}
