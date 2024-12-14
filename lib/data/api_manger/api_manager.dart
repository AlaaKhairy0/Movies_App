import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/model/categories_response/CategoriesResponse.dart';
import 'package:movies_app/data/model/movie_details_response/MovieDetailsResponse.dart';
import 'package:movies_app/data/model/movies_response/MoviesResponse.dart';

class ApiManager {
  static String baseUrl = 'api.themoviedb.org';
  static String apiAccessToken =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZWEzNmQwMzMxZjViZjkwMzIyODJkYTNkZjIzM2RlNyIsIm5iZiI6MTczMzc5ODI4Mi45MTgwMDAyLCJzdWIiOiI2NzU3YTk4YTMxZjlkMWM4ZjIzNzBhZjAiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.Vk5nw3sTbjNo50yc4IcLbudE44J2qQwBi4CHj09OCf0';
  static String apiKey = 'dea36d0331f5bf9032282da3df233de7';

  static Future<CategoriesResponse> getCategories() async {
    Uri url = Uri.https(baseUrl, '/3/genre/movie/list', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
    });

    var response = await http.get(url);

    var json = jsonDecode(response.body);
    CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(json);
    return categoriesResponse;
  }

  static Future<MoviesResponse> getMoviesByCategory(String genre) async {
    Uri url = Uri.https(baseUrl, '/3/discover/movie', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
      'with_genres': genre,
    });

    var response = await http.get(url);

    var json = jsonDecode(response.body);
    MoviesResponse filteredMoviesResponse = MoviesResponse.fromJson(json);
    return filteredMoviesResponse;
  }

  static Future<MoviesResponse> search({required String query}) async {
    Uri url = Uri.https(baseUrl, '/3/search/movie', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
      'query': query,
    });

    var response = await http.get(url);

    var json = jsonDecode(response.body);
    MoviesResponse filteredMoviesResponse = MoviesResponse.fromJson(json);
    return filteredMoviesResponse;
  }

  static Future<MoviesResponse> getMoviesSlider() async {
    Uri url = Uri.https(baseUrl, '/3/movie/popular', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
    });

    var response = await http.get(url);

    var json = jsonDecode(response.body);
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
    return moviesResponse;
  }

  static Future<MoviesResponse> getNewReleases() async {
    Uri url = Uri.https(baseUrl, '/3/movie/upcoming', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
    });

    var response = await http.get(url);

    var json = jsonDecode(response.body);
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
    return moviesResponse;
  }

  static Future<MoviesResponse> getRecommended() async {
    Uri url = Uri.https(baseUrl, '/3/movie/top_rated', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
    });

    var response = await http.get(url);

    var json = jsonDecode(response.body);
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
    return moviesResponse;
  }

  static Future<MovieDetailsResponse> getMovieDetails(String movieId) async {
    Uri url = Uri.https(baseUrl, '/3/movie/$movieId', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
    });

    var response = await http.get(url);

    var json = jsonDecode(response.body);
    MovieDetailsResponse movieDetailsResponse =
        MovieDetailsResponse.fromJson(json);
    return movieDetailsResponse;
  }

  static Future<MoviesResponse> getSimilarMovies(String movieId) async {
    Uri url = Uri.https(baseUrl, '/3/movie/$movieId/similar', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
    });

    var response = await http.get(url);

    var json = jsonDecode(response.body);
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
    return moviesResponse;
  }
}
