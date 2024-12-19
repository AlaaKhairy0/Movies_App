import 'package:movies_app/data/data_source_contract/movie_details_data_source.dart';
import 'package:movies_app/data/model/movie_details_response/MovieDetailsResponse.dart';
import 'package:movies_app/domain/entities/movie_details_entity.dart';
import 'package:movies_app/result.dart';

import '../../domain/repo/movie_details_repo.dart';

class MovieDetailsRepoImpl extends MovieDetailsRepo{
  MovieDetailsDataSource dataSource;
  MovieDetailsRepoImpl({required this.dataSource});
  @override
  Future<Result<MovieDetailsEntity>> getMovieDetails(String movieId) async {
    var result =await dataSource.getMovieDetails(movieId);
    switch(result){
      case Success<MovieDetailsResponse>():
        return Success(data: result.data.toMovieDetailsEntity());
      case ServerError<MovieDetailsResponse>():
        return ServerError(message: result.message);
      case Error<MovieDetailsResponse>():
        return Error(exception: result.exception);
    }
  }

}