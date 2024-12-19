import 'package:movies_app/data/data_source_contract/movies_by_search_data_source.dart';
import 'package:movies_app/data/model/movies_response/movie.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repo/movies_by_search_repo.dart';
import 'package:movies_app/result.dart';

class MoviesBySearchRepoImpl extends MoviesBySearchRepo {
  MoviesBySearchDataSource dataSource;

  MoviesBySearchRepoImpl({required this.dataSource});

  @override
  Future<Result<List<MovieEntity>>> getMoviesBySearch(String query) async {
    var result = await dataSource.getMoviesBySearch(query);
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
