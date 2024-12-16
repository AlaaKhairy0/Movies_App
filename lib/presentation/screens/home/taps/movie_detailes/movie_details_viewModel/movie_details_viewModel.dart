import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/model/movie_details_response/MovieDetailsResponse.dart';
import 'package:movies_app/data/model/movies_response/movie.dart';
import 'package:movies_app/result.dart';

class MovieDetailsViewModel extends Cubit<BaseState>{
  MovieDetailsViewModel():super(LoadingState());
  void getMovieDetails(String movieId)async{
    emit(LoadingState());
    var response = await ApiManager.getMovieDetails(movieId);
    switch (response){
      case Success<MovieDetailsResponse>():
         emit(SuccessState(data: response.data));
      case ServerError<MovieDetailsResponse>():
        emit(ErrorState(serverError: response));
      case Error<MovieDetailsResponse>():
        emit(ErrorState(error: response));
    }
  }
  void getSimilarMovies(String movieId)async{
    emit(LoadingState());
    var response =await ApiManager.getSimilarMovies(movieId);
    switch(response){
      case Success<List<Movie>>():
        emit(SuccessState(data: response.data));
      case ServerError<List<Movie>>():
        emit(ErrorState(serverError: response));
      case Error<List<Movie>>():
        emit((ErrorState(error: response)));
    }

  }
}