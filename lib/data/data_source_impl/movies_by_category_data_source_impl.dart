import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/model/movies_response/movie.dart';

import 'package:movies_app/result.dart';

import '../data_source_contract/movies_by_category_data_source.dart';

class MoviesByCategoryDataSourceImpl extends MoviesByCategoryDataSource{
  ApiManager apiManager;
  MoviesByCategoryDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Movie>>> getMoviesByCategory(String genre)async {
   var result = await apiManager.getMoviesByCategory(genre);
   switch(result){
     case Success<List<Movie>>():
       return Success(data: result.data);
     case ServerError<List<Movie>>():
       return ServerError(message: result.message);
     case Error<List<Movie>>():
       return Error(exception: result.exception);
   }
  }
}