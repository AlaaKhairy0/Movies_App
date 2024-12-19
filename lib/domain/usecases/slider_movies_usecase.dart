import 'package:movies_app/domain/repo/slider_movies_repo.dart';

import '../../result.dart';
import '../entities/movie_entity.dart';

class GetSliderMoviesUseCase{
  SliderMoviesRepo repo;
  GetSliderMoviesUseCase({required this.repo});
  Future<Result<List<MovieEntity>>> execute(){
    return repo.getMoviesSlider();
  }
}