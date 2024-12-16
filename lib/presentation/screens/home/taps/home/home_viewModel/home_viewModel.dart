import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/model/movies_response/movie.dart';
import 'package:movies_app/result.dart';

class HomeViewModel extends Cubit<BaseState>{
  HomeViewModel():super(LoadingState());
  void getMoviesSlider() async{
    emit(LoadingState());
    var response = await ApiManager.getMoviesSlider();
    switch(response){
      case Success<List<Movie>>():
        emit(SuccessState(data: response.data));
      case ServerError<List<Movie>>():
        emit(ErrorState(serverError: response));
      case Error<List<Movie>>():
        emit(ErrorState(error: response));
    }
  }
  void getNewReleases()async{
    emit(LoadingState());
    var response = await ApiManager.getNewReleases();
    switch(response){
      case Success<List<Movie>>():
        emit(SuccessState(data: response.data));
      case ServerError<List<Movie>>():
        emit(ErrorState(serverError: response));
      case Error<List<Movie>>():
        emit(ErrorState(error: response));
    }
  }
  void getRecommended()async{
    emit(LoadingState());
    var response = await ApiManager.getRecommended();
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