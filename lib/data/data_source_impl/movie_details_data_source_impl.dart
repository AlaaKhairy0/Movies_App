import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/model/movie_details_response/MovieDetailsResponse.dart';
import 'package:movies_app/result.dart';

import '../data_source_contract/movie_details_data_source.dart';

 class MovieDetailsDataSourceImpl extends MovieDetailsDataSource{
   ApiManager apiManager;
   MovieDetailsDataSourceImpl({required this.apiManager});
  @override
  Future<Result<MovieDetailsResponse>> getMovieDetails(String movieId) async {
    var result = await apiManager.getMovieDetails(movieId);
    switch(result){
      case Success<MovieDetailsResponse>():
        return Success(data: result.data);
      case ServerError<MovieDetailsResponse>():
        return ServerError(message: result.message);
      case Error<MovieDetailsResponse>():
        return Error(exception: result.exception);
    }
  }
}