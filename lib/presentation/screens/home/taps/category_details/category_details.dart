import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import '../watchList/movie_item.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Action',style: AppStyle.tabHeader,),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) => WatchlistItem(),
            separatorBuilder: (context, index) => const Divider(
                  height: 1,
                ),
            itemCount: 4),
      ),
    );
  }
}
