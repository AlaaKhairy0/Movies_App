import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/presentation/screens/home/taps/search/search_delegate.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Center(
            child: SizedBox(
              width: 345.w,
              child: TextField(

                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search",

                  hintStyle: AppStyle.search,
                  filled: true,
                  fillColor: ColorsManager.gray2,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                      width: 3,
                      color: ColorsManager.gray,
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                      width: 3,
                      color: ColorsManager.gray,
                    ),
                  ),
                ),
                onTap: () {
                  showSearch(context: context, delegate: MovieSearchDelegate());
                },
              ),
            ),
          ),
          SizedBox(
            height: 140.h,
          ),
          Image.asset(AssetsManager.noResult,width: 120.w,height: 120.h,),
        ],
      ),
    );
  }
}
