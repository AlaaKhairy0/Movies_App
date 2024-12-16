import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/model/movies_response/movie.dart';
import 'package:movies_app/result.dart';

class SearchViewModel extends Cubit<BaseState>{
  SearchViewModel():super(LoadingState());
  void searchMovies(String query)async{
    emit(LoadingState());
    var response = await ApiManager.search(query: query);
    switch(response){
      case Success<List<Movie>>():
        emit(SuccessState(data: response.data));
      case ServerError<List<Movie>>():
        emit(ErrorState(serverError: response));
      case Error<List<Movie>>():
       emit(ErrorState(error: response));
    }
  }
}