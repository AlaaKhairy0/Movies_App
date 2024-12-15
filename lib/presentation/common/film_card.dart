import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/routes_manager.dart';
import 'package:movies_app/data/model/movies_response/movie.dart';

import '../../core/constatns_manager.dart';

class FilmCard extends StatefulWidget {
  FilmCard({super.key, required this.results});

  Movie results;
  bool isClicked = false;

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIfMovieIsSaved();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RoutesManager.movieDetails,
          arguments: widget.results),
      child: Stack(children: [
        SizedBox(
          width: 129.w,
          height: 199.h,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            child: Image.network(
              '${ConstantsManager.baseNetworkImgUrl}${widget.results?.posterPath}',
              fit: BoxFit.fill,
            ),
          ),
        ),
        GestureDetector(
            onTap: () {
              widget.isClicked = !widget.isClicked;
              widget.isClicked
                  ? sendMovieToFireStore()
                  : deleteMovieFromFireStore(widget.results.id.toString());
              setState(() {});
            },
            child: Image.asset(
              widget.isClicked
                  ? AssetsManager.saveIcon
                  : AssetsManager.unSaveIcon,
              height: 36.h,
              width: 27.w,
            )),
      ]),
    );
  }

  void sendMovieToFireStore() {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('movies');
    DocumentReference documentReference =
        collectionReference.doc(widget.results.id.toString());
    Movie movie = Movie(
      id: widget.results.id,
      title: widget.results.title,
      posterPath: widget.results.posterPath,
      releaseDate: widget.results.releaseDate,
      overview: widget.results.overview,
    );
    documentReference.set({
        ...movie.toJson(),
        'isSaved': true,});
  }

  Future<void> deleteMovieFromFireStore(String movieId) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('movies');
    await collectionReference.doc(movieId).delete();
  }

  Future<void> checkIfMovieIsSaved() async {
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('movies');
    DocumentSnapshot documentSnapshot =
    await collectionReference.doc(widget.results.id.toString()).get();

    if (documentSnapshot.exists && documentSnapshot.get('isSaved') == true) {
      setState(() {
        widget.isClicked = true;
      });
    } else {
      setState(() {
        widget.isClicked = false;
      });
    }
  }

}
