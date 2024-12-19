import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/data/api_manger/api_manager.dart';
import 'package:movies_app/data/data_source_impl/movies_by_category_data_source_impl.dart';
import 'package:movies_app/data/model/categories_response/genre.dart';
import 'package:movies_app/data/repo_impl/movies_by_category_repo_impl.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/usecases/movies_by_category_usecase.dart';
import 'package:movies_app/presentation/common/error_state_widget.dart';
import 'package:movies_app/presentation/common/loading_state_widget.dart';
import 'package:movies_app/presentation/screens/home/taps/category_details/category_details_viewModel/category_details_viewModel.dart';
import '../../../../../common/movie_item.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({
    super.key,
  });

  //Genres category;
  @override
  Widget build(BuildContext context) {
    Genre category = ModalRoute.of(context)!.settings.arguments as Genre;
    CategoryDetailsViewModel viewModel = CategoryDetailsViewModel(
        useCase: GetMoviesByCategoryUseCase(
            repo: MoviesByCategoryRepoImpl(
                dataSource:
                    MoviesByCategoryDataSourceImpl(apiManager: ApiManager()))));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            category.name ?? '',
            style: AppStyle.tabHeader,
          ),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) =>
              viewModel..getMoviesByCategory(category.id.toString()),
          child: BlocBuilder<CategoryDetailsViewModel, BaseState>(
            builder: (context, state) {
              if (state is SuccessState) {
                List<MovieEntity> movies = state.data;
                return Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context, index) => MovieItem(
                            movie: movies[index],
                          ),
                      separatorBuilder: (context, index) => const Divider(
                            height: 1,
                          ),
                      itemCount: movies.length),
                );
              }
              if (state is ErrorState) {
                return ErrorStateWidget(
                  error: state.error,
                  serverError: state.serverError,
                );
              }
              return LoadingWidget();
            },
          ),
        ));
  }
}
