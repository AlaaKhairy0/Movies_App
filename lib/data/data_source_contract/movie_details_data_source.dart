import 'package:movies_app/data/model/movie_details_response/MovieDetailsResponse.dart';
import 'package:movies_app/result.dart';

import '../model/movies_response/movies_response.dart';

abstract class MovieDetailsDataSource{
  Future<Result<MovieDetailsResponse>> getMovieDetails(String movieId);
}