import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/data/model/categories_response/genre.dart';
import 'package:movies_app/domain/usecases/categories_usecase.dart';
import 'package:movies_app/result.dart';

class BrowseViewModel extends Cubit<BaseState> {
  GetCategoriesUseCase useCase;
  BrowseViewModel({required this.useCase}) : super(LoadingState());

  void getCategories() async {
    emit(LoadingState());
    var response = await useCase.execute();
    switch (response) {
      case Success<List<Genre>>():
        emit(SuccessState(data: response.data));
      case ServerError<List<Genre>>():
        emit(ErrorState(serverError: response));
      case Error<List<Genre>>():
        emit(ErrorState(error: response));
    }
  }
}
