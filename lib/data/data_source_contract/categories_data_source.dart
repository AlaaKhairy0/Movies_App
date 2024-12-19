import 'package:movies_app/data/model/categories_response/genre.dart';
import 'package:movies_app/result.dart';

abstract class CategoriesDataSource{
  Future<Result<List<Genre>>>getCategories();
}