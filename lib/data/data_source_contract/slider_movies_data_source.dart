import '../../result.dart';
import '../model/movies_response/movie.dart';

abstract class SliderMoviesDataSource{
  Future<Result<List<Movie>>> getMoviesSlider();
}