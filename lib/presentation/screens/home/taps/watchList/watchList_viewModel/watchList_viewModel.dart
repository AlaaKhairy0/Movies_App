import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/base/base_state.dart';
import '../../../../../../data/model/movies_response/movie.dart';

class WatchListViewModel extends Cubit<BaseState> {
  WatchListViewModel() : super(LoadingState());
  List<Movie> movies = [];

  void getMovieFromFireStore() async {
    emit(LoadingState());
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('movies');
      QuerySnapshot collectionSnapshot = await collectionReference.get();
      List<QueryDocumentSnapshot> documentsSnapShot = collectionSnapshot.docs;

      movies = documentsSnapShot.map((docSnapShot) {
        Map<String, dynamic> json = docSnapShot.data() as Map<String, dynamic>;
        return Movie.fromJson(json);
      }).toList();

      emit(SuccessState(data: movies));
    } on Exception catch (e) {
      emit(ErrorState());
    }
  }
}