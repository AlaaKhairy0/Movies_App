import 'package:movies_app/data/data_source_contract/recommended_movies_data_source.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/result.dart';

import '../../domain/repo/recommended_movies_repo.dart';
import '../../domain/repo/similar_movies_repo.dart';
import '../data_source_contract/similar_movies_data_source.dart';
import '../model/movies_response/movie.dart';

 class SimilarMoviesRepoImpl extends SimilarMoviesRepo{
   SimilarMoviesDataSource dataSource;
   SimilarMoviesRepoImpl({required this.dataSource});
  @override

  @override
  Future<Result<List<MovieEntity>>> getSimilarMovies(String movieId) async {
    var result = await dataSource.getSimilarMovies(movieId);
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