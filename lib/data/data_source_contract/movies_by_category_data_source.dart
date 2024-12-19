import 'package:movies_app/data/model/movies_response/movie.dart';
import 'package:movies_app/result.dart';

abstract class MoviesByCategoryDataSource{
  Future<Result<List<Movie>>> getMoviesByCategory(String genre);
}