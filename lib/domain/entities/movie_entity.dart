class MovieEntity {
  String? backdropPath;
  List<num>? genreIds;
  String? posterPath;
  String? releaseDate;
  String? title;
  num? voteAverage;
  String? overview;
  num? id;

  MovieEntity(
      {this.backdropPath,
      this.genreIds,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.voteAverage,
      this.overview,
      this.id});
}
