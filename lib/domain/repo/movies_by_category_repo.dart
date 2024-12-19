import 'package:movies_app/domain/entities/movie_entity.dart';
import '../../result.dart';

abstract class MoviesByCategoryRepo{
  Future<Result<List<MovieEntity>>> getMoviesByCategory(String genre);
}