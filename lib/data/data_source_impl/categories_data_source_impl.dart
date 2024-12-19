import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/model/categories_response/genre.dart';

import 'package:movies_app/result.dart';

import '../data_source_contract/categories_data_source.dart';

class CategoriesDataSourceImpl extends CategoriesDataSource{
  ApiManager apiManager;
  CategoriesDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Genre>>> getCategories()async {
    var result = await apiManager.getCategories();
    switch(result){
      case Success<List<Genre>>():
        return Success(data: result.data);
      case ServerError<List<Genre>>():
        return ServerError(message: result.message);
      case Error<List<Genre>>():
        return Error(exception: result.exception);
    }
  }
}