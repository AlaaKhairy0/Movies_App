import 'package:movies_app/domain/repo/new_releases_movies_repo.dart';

import '../../result.dart';
import '../entities/movie_entity.dart';

class GetNewReleasesMoviesUseCase{
  NewReleasesMoviesRepo repo;
  GetNewReleasesMoviesUseCase({required this.repo});
  Future<Result<List<MovieEntity>>> execute(){
    return repo.getNewReleases();
  }
}