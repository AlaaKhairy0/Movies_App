import 'package:movies_app/data/data_source_contract/categories_data_source.dart';
import 'package:movies_app/data/model/categories_response/genre.dart';
import 'package:movies_app/domain/repo/categories_repo.dart';
import 'package:movies_app/result.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  CategoriesDataSource dataSource;

  CategoriesRepoImpl({required this.dataSource});

  @override
  Future<Result<List<Genre>>> getCategories() async {
    var result = await dataSource.getCategories();
    switch (result) {
      case Success<List<Genre>>():
        return Success(data: result.data);
      case ServerError<List<Genre>>():
        return ServerError(message: result.message);
      case Error<List<Genre>>():
        return Error(exception: result.exception);
    }
  }
}
