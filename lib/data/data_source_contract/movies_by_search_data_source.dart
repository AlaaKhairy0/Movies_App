import 'package:movies_app/data/model/movies_response/movie.dart';
import 'package:movies_app/result.dart';

abstract class MoviesBySearchDataSource{
  Future<Result<List<Movie>>> getMoviesBySearch(String query);
}