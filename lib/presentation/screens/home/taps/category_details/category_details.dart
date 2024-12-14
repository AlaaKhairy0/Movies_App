import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/model/categories_response/Genres.dart';
import 'package:movies_app/data/model/movies_response/Results.dart';
import '../widgets/movie_item.dart';

class CategoryDetails extends StatelessWidget {
   CategoryDetails({super.key,});
  //Genres category;
  @override
  Widget build(BuildContext context) {
    Genres category = ModalRoute.of(context)!.settings.arguments as Genres;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(category.name??'',style: AppStyle.tabHeader,),
        centerTitle: true,
      ),
      body: FutureBuilder(future: ApiManager.getMoviesByCategory(category.id.toString()), builder: (context, snapshot) {
        List<Results> movies = snapshot.data?.results ?? [];
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
