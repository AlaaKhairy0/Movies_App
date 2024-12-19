import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/usecases/movies_by_search_usecase.dart';
import 'package:movies_app/result.dart';

class SearchViewModel extends Cubit<BaseState>{
  GetMoviesBySearchUseCase useCase;
  SearchViewModel({required this.useCase}):super(LoadingState());
  void searchMovies(String query)async{
    emit(LoadingState());
    var response = await useCase.execute(query);
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