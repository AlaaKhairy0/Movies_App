import 'package:movies_app/data/model/movies_response/movie.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/result.dart';
import '../../domain/repo/movies_by_category_repo.dart';
import '../data_source_contract/movies_by_category_data_source.dart';

class MoviesByCategoryRepoImpl extends MoviesByCategoryRepo {
  MoviesByCategoryDataSource dataSource;

  MoviesByCategoryRepoImpl({required this.dataSource});

  @override
  Future<Result<List<MovieEntity>>> getMoviesByCategory(String genre) async {
    var result = await dataSource.getMoviesByCategory(genre);
    switch (result) {
      case Success<List<Movie>>():
        return Success(
            data: result.data
                .map(
                  (movie) => movie.toMovieEntity(),
                )
                .toList());
      case ServerError<List<Movie>>():
        return ServerError(message: result.message);
      case Error<List<Movie>>():
        return Error(exception: result.exception);
    }
  }
}
