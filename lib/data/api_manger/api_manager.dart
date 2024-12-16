import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/model/categories_response/categories_response.dart';
import 'package:movies_app/data/model/categories_response/genre.dart';
import 'package:movies_app/data/model/movie_details_response/MovieDetailsResponse.dart';
import 'package:movies_app/data/model/movies_response/movie.dart';
import 'package:movies_app/data/model/movies_response/movies_response.dart';
import 'package:movies_app/result.dart';

class ApiManager {
  static String baseUrl = 'api.themoviedb.org';
  static String apiAccessToken =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZWEzNmQwMzMxZjViZjkwMzIyODJkYTNkZjIzM2RlNyIsIm5iZiI6MTczMzc5ODI4Mi45MTgwMDAyLCJzdWIiOiI2NzU3YTk4YTMxZjlkMWM4ZjIzNzBhZjAiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.Vk5nw3sTbjNo50yc4IcLbudE44J2qQwBi4CHj09OCf0';
  static String apiKey = 'dea36d0331f5bf9032282da3df233de7';

  static Future<Result<List<Genre>>> getCategories() async {
    Uri url = Uri.https(baseUrl, '/3/genre/movie/list', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
    });

    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(json);
      if (categoriesResponse.statusMessage != null) {
        return ServerError(message: categoriesResponse.statusMessage ?? '');
      } else {
        return Success(data: categoriesResponse.genres ?? []);
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  static Future<Result<List<Movie>>> getMoviesByCategory(String genre) async {
    Uri url = Uri.https(baseUrl, '/3/discover/movie', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
      'with_genres': genre,
    });

    try {
      var response = await http.get(url);

      var json = jsonDecode(response.body);
      MoviesResponse filteredMoviesResponse = MoviesResponse.fromJson(json);
      if (filteredMoviesResponse.statusMessage != null) {
        return ServerError(message: filteredMoviesResponse.statusMessage ?? '');
      } else {
        return Success(data: filteredMoviesResponse.results ?? []);
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  static Future<Result<List<Movie>>> search({required String query}) async {
    Uri url = Uri.https(baseUrl, '/3/search/movie', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
      'query': query,
    });
    try{
      var response = await http.get(url);

      var json = jsonDecode(response.body);
      MoviesResponse filteredMoviesResponse = MoviesResponse.fromJson(json);
      if (filteredMoviesResponse.statusMessage != null) {
        return ServerError(message: filteredMoviesResponse.statusMessage ?? '');
      } else {
        return Success(data: filteredMoviesResponse.results ?? []);
      }
    }on Exception catch(e){
      return Error(exception: e);
    }
  }

  static Future<Result<List<Movie>>> getMoviesSlider() async {
    Uri url = Uri.https(baseUrl, '/3/movie/popular', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
    });
    try {
      var response = await http.get(url);

      var json = jsonDecode(response.body);
      MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
      if (moviesResponse.statusMessage != null) {
        return ServerError(message: moviesResponse.statusMessage ?? '');
      } else {
        return Success(data: moviesResponse.results ?? []);
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  static Future<Result<List<Movie>>> getNewReleases() async {
    Uri url = Uri.https(baseUrl, '/3/movie/upcoming', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
    });
    try {
      var response = await http.get(url);

      var json = jsonDecode(response.body);
      MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
      if (moviesResponse.statusMessage != null) {
        return ServerError(message: moviesResponse.statusMessage ?? '');
      } else {
        return Success(data: moviesResponse.results ?? []);
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  static Future<Result<List<Movie>>> getRecommended() async {
    Uri url = Uri.https(baseUrl, '/3/movie/top_rated', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
    });

    try {
      var response = await http.get(url);

      var json = jsonDecode(response.body);
      MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
      if (moviesResponse.statusMessage != null) {
        return ServerError(message: moviesResponse.statusMessage ?? '');
      } else {
        return Success(data: moviesResponse.results ?? []);
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  static Future<Result<MovieDetailsResponse>> getMovieDetails(
      String movieId) async {
    Uri url = Uri.https(baseUrl, '/3/movie/$movieId', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
    });
    try {
      var response = await http.get(url);

      var json = jsonDecode(response.body);
      MovieDetailsResponse movieDetailsResponse =
          MovieDetailsResponse.fromJson(json);
      if (movieDetailsResponse.statusMessage != null) {
        return ServerError(message: movieDetailsResponse.statusMessage ?? '');
      } else {
        return Success(data: movieDetailsResponse);
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  static Future<Result<List<Movie>>> getSimilarMovies(String movieId) async {
    Uri url = Uri.https(baseUrl, '/3/movie/$movieId/similar', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
    });

    try {
      var response = await http.get(url);

      var json = jsonDecode(response.body);
      MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
      if (moviesResponse.statusMessage != null) {
        return ServerError(message: moviesResponse.statusMessage ?? '');
      } else {
        return Success(data: moviesResponse.results ?? []);
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }
}
