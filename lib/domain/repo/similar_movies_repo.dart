import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/result.dart';

abstract class SimilarMoviesRepo{
  Future<Result<List<MovieEntity>>> getSimilarMovies(String movieId);
}