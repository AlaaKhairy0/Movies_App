import 'package:movies_app/domain/repo/recommended_movies_repo.dart';

import '../../result.dart';
import '../entities/movie_entity.dart';

class GetRecommendedMoviesUseCase{
  RecommendedMoviesRepo repo;
  GetRecommendedMoviesUseCase({required this.repo});
  Future<Result<List<MovieEntity>>> execute(){
    return repo.getRecommended();
  }
}