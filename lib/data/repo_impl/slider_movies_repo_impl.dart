import 'package:movies_app/data/data_source_contract/slider_movies_data_source.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/result.dart';

import '../../domain/repo/slider_movies_repo.dart';
import '../model/movies_response/movie.dart';

 class SliderMoviesRepoImpl extends SliderMoviesRepo{
   SliderMoviesDataSource dataSource;
   SliderMoviesRepoImpl({required this.dataSource});
  @override
  Future<Result<List<MovieEntity>>> getMoviesSlider() async {
    var result = await dataSource.getMoviesSlider();
    switch (result) {
      case Success<List<Movie>>():
        return Success(
            data: result.data
                .map(
                  (movie) => movie.toMovieEntity(),
            )
                .toList());
      case ServerError<List<Movie>>():
        return ServerError(message: result.message);
      case Error<List<Movie>>():
        return Error(exception: result.exception);
    }
  }

}