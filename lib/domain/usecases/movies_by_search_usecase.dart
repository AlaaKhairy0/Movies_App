import 'package:movies_app/domain/repo/movies_by_search_repo.dart';

import '../../result.dart';
import '../entities/movie_entity.dart';

class GetMoviesBySearchUseCase{
  MoviesBySearchRepo repo;
  GetMoviesBySearchUseCase({required this.repo});
  Future<Result<List<MovieEntity>>> execute(String query){
    return repo.getMoviesBySearch(query);
  }
}