import 'package:flutter/material.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/routes_manager.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesManager.categoryDetails);
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
        child: Text('Action',style: AppStyle.categoryLabel,),
      ),
    );
  }
}