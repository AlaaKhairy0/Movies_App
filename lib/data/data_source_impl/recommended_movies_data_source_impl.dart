import 'package:movies_app/data/api_manger/api_manager.dart';

import '../../result.dart';
import '../data_source_contract/recommended_movies_data_source.dart';
import '../model/movies_response/movie.dart';

class RecommendedMoviesDataSourceImpl extends RecommendedMoviesDataSource {
  ApiManager apiManager;

  RecommendedMoviesDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Movie>>> getRecommended() async {
    var result = await apiManager.getRecommended();
    switch (result) {
      case Success<List<Movie>>():
        return Success(data: result.data);
      case ServerError<List<Movie>>():
        return ServerError(message: result.message);
      case Error<List<Movie>>():
        return Error(exception: result.exception);
    }
  }
}
