import '../../result.dart';
import '../model/movies_response/movie.dart';

abstract class NewReleasesMoviesDataSource{
  Future<Result<List<Movie>>> getNewReleases();
}