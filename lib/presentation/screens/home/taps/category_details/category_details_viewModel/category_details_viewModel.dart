import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/usecases/movies_by_category_usecase.dart';
import 'package:movies_app/result.dart';

class CategoryDetailsViewModel extends Cubit<BaseState>{
  GetMoviesByCategoryUseCase useCase;
  CategoryDetailsViewModel({required this.useCase}):super(LoadingState());
  void getMoviesByCategory(String genre)async{
    emit(LoadingState());
    var response = await useCase.execute(genre);
    switch(response){
      case Success<List<MovieEntity>>():
        emit(SuccessState(data: response.data));
      case ServerError<List<MovieEntity>>():
        emit(ErrorState(serverError: response));
      case Error<List<MovieEntity>>():
        emit(ErrorState(error: response));
    }
  }
}