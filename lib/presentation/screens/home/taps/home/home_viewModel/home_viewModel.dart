import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/usecases/new_releases_movies_usecase.dart';
import 'package:movies_app/domain/usecases/recommended_movies_usecase.dart';
import 'package:movies_app/domain/usecases/slider_movies_usecase.dart';
import 'package:movies_app/result.dart';

class HomeViewModel extends Cubit<BaseState> {
  GetNewReleasesMoviesUseCase? newReleasesUseCase;
  GetRecommendedMoviesUseCase? recommendedUseCase;
  GetSliderMoviesUseCase? sliderUseCase;

  HomeViewModel(
      { this.newReleasesUseCase, this.recommendedUseCase, this.sliderUseCase})
      : super(LoadingState());

  void getMoviesSlider() async {
    if(sliderUseCase != null){
      emit(LoadingState());
      var response = await sliderUseCase!.execute();
      switch (response) {
        case Success<List<MovieEntity>>():
          emit(SuccessState(data: response.data));
        case ServerError<List<MovieEntity>>():
          emit(ErrorState(serverError: response));
        case Error<List<MovieEntity>>():
          emit(ErrorState(error: response));
      }
    }
  }

  void getNewReleases() async {
    if(newReleasesUseCase !=null){
      emit(LoadingState());
      var response = await newReleasesUseCase!.execute();
      switch (response) {
        case Success<List<MovieEntity>>():
          emit(SuccessState(data: response.data));
        case ServerError<List<MovieEntity>>():
          emit(ErrorState(serverError: response));
        case Error<List<MovieEntity>>():
          emit(ErrorState(error: response));
      }
    }
  }

  void getRecommended() async {
   if(recommendedUseCase !=null) {
      emit(LoadingState());
      var response = await recommendedUseCase!.execute();
      switch (response) {
        case Success<List<MovieEntity>>():
          emit(SuccessState(data: response.data));
        case ServerError<List<MovieEntity>>():
          emit(ErrorState(serverError: response));
        case Error<List<MovieEntity>>():
          emit(ErrorState(error: response));
      }
    }
  }
}
