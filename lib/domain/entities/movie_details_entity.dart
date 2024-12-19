import '../../data/model/movie_details_response/Genres.dart';

class MovieDetailsEntity{
  List<Genres>? genres;
  String? backdropPath;
  num? id;
  String? overview;
  num? voteAverage;
  String? title;
  String? releaseDate;

  MovieDetailsEntity(
      {this.genres,
      this.backdropPath,
      this.id,
      this.overview,
      this.voteAverage,
      this.title,
      this.releaseDate});
}