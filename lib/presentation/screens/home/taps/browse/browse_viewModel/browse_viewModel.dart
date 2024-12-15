import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/model/categories_response/genre.dart';
import 'package:movies_app/result.dart';

class BrowseViewModel extends Cubit<BaseState> {
  BrowseViewModel() : super(LoadingState());

  void getCategories() async {
    emit(LoadingState());
    var response = await ApiManager.getCategories();
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
