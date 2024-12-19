import '../../result.dart';
import '../model/movies_response/movie.dart';

abstract class SimilarMoviesDataSource{
  Future<Result<List<Movie>>> getSimilarMovies(String movieId);
}