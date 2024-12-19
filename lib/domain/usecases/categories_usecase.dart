import 'package:movies_app/domain/repo/categories_repo.dart';
import '../../data/model/categories_response/genre.dart';
import '../../result.dart';

class GetCategoriesUseCase{
  CategoriesRepo repo;
  GetCategoriesUseCase({required this.repo});
  Future<Result<List<Genre>>> execute(){
    return repo.getCategories();
  }
}