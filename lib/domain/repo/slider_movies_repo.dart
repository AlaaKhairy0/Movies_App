import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/result.dart';

abstract class SliderMoviesRepo{
  Future<Result<List<MovieEntity>>> getMoviesSlider();
}