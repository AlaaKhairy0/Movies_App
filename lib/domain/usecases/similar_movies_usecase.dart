import 'package:movies_app/domain/repo/recommended_movies_repo.dart';

import '../../result.dart';
import '../entities/movie_entity.dart';
import '../repo/similar_movies_repo.dart';

class GetSimilarMoviesUseCase{
  SimilarMoviesRepo repo;
  GetSimilarMoviesUseCase({required this.repo});
  Future<Result<List<MovieEntity>>> execute(String movieId){
    return repo.getSimilarMovies(movieId);
  }
}