import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/model/categories_response/Genres.dart';
import 'package:movies_app/presentation/screens/home/taps/browse/ctegory_item.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        List<Genres> categories = snapshot.data?.genres ?? [];
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
                    childAspectRatio: (1 / .85),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                  ),
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      category: categories[index],
                    );
                  },
                  itemCount: categories.length,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
