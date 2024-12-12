import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/presentation/screens/home/taps/watchList/watchList_item.dart';
import 'package:movies_app/presentation/screens/home/taps/widgets/movie_item.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Text(
            'WatchList',
            style: AppStyle.tabHeader,
          ),
          Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) => WatchListItem(),
                  separatorBuilder: (context, index) => Divider(
                        height: 1,
                      ),
                  itemCount: 4))
        ],
      ),
    );
  }
}
