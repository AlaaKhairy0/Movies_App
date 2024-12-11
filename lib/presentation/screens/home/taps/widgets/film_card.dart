import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';

class FilmCard extends StatefulWidget {
   FilmCard({super.key});

   bool isClicked = false ;
  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: 129.w,
        height: 199.h,
        child: Image.asset(
          AssetsManager.imageCard,
          fit: BoxFit.cover,
        ),
      ),
      GestureDetector(
          onTap: () {
          widget.isClicked=!widget.isClicked;
          setState(() {

          });
            },
          child: Image.asset(widget.isClicked?
            AssetsManager.saveIcon: AssetsManager.unSaveIcon,
            height: 36.h,
            width: 27.w,
          )),
    ]);
  }
}
