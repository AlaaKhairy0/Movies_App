import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/presentation/screens/home/taps/watchList/watchList_item.dart';

import '../../../../../data/model/movies_response/Results.dart';

class WatchListTab extends StatefulWidget {
   WatchListTab({super.key});

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  List<Results> movies = [];

  @override
  Widget build(BuildContext context) {
    getMovieFromFireStore();
    if(movies.isEmpty) return const Center(child: CircularProgressIndicator(color: ColorsManager.yellow,));
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
                  itemBuilder: (context, index) => WatchListItem(
                        movie: movies[index],
                      ),
                  separatorBuilder: (context, index) => Divider(
                        height: 1,
                      ),
                  itemCount: movies.length))
        ],
      ),
    );
  }

  void getMovieFromFireStore() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('movies');
    QuerySnapshot collectionSnapshot = await collectionReference.get();
    List<QueryDocumentSnapshot> documentsSnapShot = collectionSnapshot.docs;
    movies = documentsSnapShot.map(
      (docSnapShot) {
        Map<String, dynamic> json = docSnapShot.data() as Map<String, dynamic>;
        Results movie = Results.fromJson(json);
        return movie;
      },
    ).toList();
    setState(() {

    });

  }
}
