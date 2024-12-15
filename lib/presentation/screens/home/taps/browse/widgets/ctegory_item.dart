import 'package:flutter/material.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/routes_manager.dart';
import 'package:movies_app/data/model/categories_response/categories_response.dart';
import 'package:movies_app/data/model/categories_response/genre.dart';

class CategoryItem extends StatelessWidget {
   CategoryItem({super.key,required this.category});
  Genre category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesManager.categoryDetails,arguments: category);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.categoryItem),
            opacity: .6,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Text(category.name??'',style: AppStyle.categoryLabel,),
      ),
    );
  }
}