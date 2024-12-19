import '../../result.dart';
import '../model/movies_response/movie.dart';

abstract class RecommendedMoviesDataSource{
  Future<Result<List<Movie>>> getRecommended();
}