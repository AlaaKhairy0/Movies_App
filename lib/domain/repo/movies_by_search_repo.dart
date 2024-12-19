import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/result.dart';

abstract class MoviesBySearchRepo{
  Future<Result<List<MovieEntity>>> getMoviesBySearch(String query);
}