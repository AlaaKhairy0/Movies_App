import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/config/theme/app_style.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/presentation/common/error_state_widget.dart';
import 'package:movies_app/presentation/common/loading_state_widget.dart';
import 'package:movies_app/presentation/screens/home/taps/watchList/watchList_viewModel/watchList_viewModel.dart';
import 'package:movies_app/presentation/screens/home/taps/watchList/widgets/watchList_item.dart';

import '../../../../../../data/model/movies_response/movie.dart';

class WatchListView extends StatefulWidget {
   WatchListView({super.key});

  @override
  State<WatchListView> createState() => WatchListViewState();
}

class WatchListViewState extends State<WatchListView> {
  WatchListViewModel viewModel = WatchListViewModel();
  void getMoviesFromFireStore() {
    viewModel.getMovieFromFireStore();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Text(
            'WatchList',
            style: AppStyle.tabHeader,
          ),
          BlocProvider(
            create: (context) => viewModel..getMovieFromFireStore(),
            child: BlocBuilder<WatchListViewModel, BaseState>(
              builder: (context, state) {
                if (state is SuccessState) {
                  List<Movie> movies = state.data as List<Movie>;
                  if (movies.isEmpty) {
                    return Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Spacer(),
                          Image.asset(
                            AssetsManager.noResult,
                            width: 104.w,
                            height: 114.h,
                          ),
                          const Spacer(),
                        ],
                      ),
                    );
                  }
                  return Expanded(
                      child: ListView.separated(
                          padding: REdgeInsets.all(0),
                          itemBuilder: (context, index) => WatchListItem(
                                movie: movies[index],
                              ),
                          separatorBuilder: (context, index) => Divider(
                                height: 1.h,
                              ),
                          itemCount: movies.length));
                }
                if (state is ErrorState) {
                  return ErrorStateWidget();
                }
                return LoadingWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}
