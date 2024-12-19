import 'package:movies_app/domain/repo/movie_details_repo.dart';

import '../../result.dart';
import '../entities/movie_details_entity.dart';

class GetMovieDetailsUseCase{
  MovieDetailsRepo repo;
  GetMovieDetailsUseCase({required this.repo});
  Future<Result<MovieDetailsEntity>> execute(String movieId){
    return repo.getMovieDetails(movieId);
  }
}