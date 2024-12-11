import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/presentation/screens/home/taps/browse/ctegory_item.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Browse Category ',
            style: AppStyle.tabHeader,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (1/.85),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
              ),padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) => CategoryItem(),
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
