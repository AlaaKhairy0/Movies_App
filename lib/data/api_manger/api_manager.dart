import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/model/categories_response/CategoriesResponse.dart';
import 'package:movies_app/data/model/filtered_movies_response/FilteredMoviesResponse.dart';

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
  static Future<FilteredMoviesResponse> getMoviesByCategory(String genre) async {
    Uri url = Uri.https(baseUrl, '/3/discover/movie', {
      'api_key': apiKey,
      'Authorization': apiAccessToken,
      'with_genres' : genre,
    });

    var response = await http.get(url);

    var json = jsonDecode(response.body);
    FilteredMoviesResponse filteredMoviesResponse = FilteredMoviesResponse.fromJson(json);
    return filteredMoviesResponse;
  }
}
