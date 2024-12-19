import 'package:movies_app/domain/repo/movies_by_category_repo.dart';
import '../../result.dart';
import '../entities/movie_entity.dart';

class GetMoviesByCategoryUseCase{
  MoviesByCategoryRepo repo;
  GetMoviesByCategoryUseCase({required this.repo});
  Future<Result<List<MovieEntity>>> execute(String genre){
    return repo.getMoviesByCategory(genre);
  }
}