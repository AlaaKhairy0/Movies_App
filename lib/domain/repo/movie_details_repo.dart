import 'package:movies_app/domain/entities/movie_details_entity.dart';
import 'package:movies_app/result.dart';

abstract class MovieDetailsRepo{
  Future<Result<MovieDetailsEntity>> getMovieDetails(String movieId);
}