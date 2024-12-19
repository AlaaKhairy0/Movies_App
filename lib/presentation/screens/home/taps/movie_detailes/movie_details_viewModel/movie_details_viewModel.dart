import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/domain/entities/movie_details_entity.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/usecases/movie_details_usecase.dart';
import 'package:movies_app/domain/usecases/similar_movies_usecase.dart';
import 'package:movies_app/result.dart';

class MovieDetailsViewModel extends Cubit<BaseState>{
  GetMovieDetailsUseCase? movieDetailsUseCase;
  GetSimilarMoviesUseCase? similarMoviesUseCase;
  MovieDetailsViewModel({ this.movieDetailsUseCase,this.similarMoviesUseCase}):super(LoadingState());
  void getMovieDetails(String movieId)async{
    emit(LoadingState());
    var response = await movieDetailsUseCase?.execute(movieId);
    switch (response){
      case Success<MovieDetailsEntity>():
         emit(SuccessState(data: response.data));
      case ServerError<MovieDetailsEntity>():
        emit(ErrorState(serverError: response));
      case Error<MovieDetailsEntity>():
        emit(ErrorState(error: response));
      case null:
        emit(LoadingState());
    }
  }
  void getSimilarMovies(String movieId)async{
    emit(LoadingState());
    var response =await similarMoviesUseCase?.execute(movieId);
    switch(response){
      case Success<List<MovieEntity>>():
        emit(SuccessState(data: response.data));
      case ServerError<List<MovieEntity>>():
        emit(ErrorState(serverError: response));
      case Error<List<MovieEntity>>():
        emit((ErrorState(error: response)));
      case null:
        emit(LoadingState());
    }

  }
}