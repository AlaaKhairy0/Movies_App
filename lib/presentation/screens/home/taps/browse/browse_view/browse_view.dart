import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/base/base_state.dart';
import 'package:movies_app/data/model/categories_response/genre.dart';
import 'package:movies_app/presentation/common/error_state_widget.dart';
import 'package:movies_app/presentation/common/loading_state_widget.dart';
import 'package:movies_app/presentation/screens/home/taps/browse/browse_viewModel/browse_viewModel.dart';
import 'package:movies_app/presentation/screens/home/taps/browse/widgets/ctegory_item.dart';

import '../../../../../../config/theme/app_style.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  BrowseViewModel viewModel = BrowseViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getCategories(),
      child: BlocBuilder<BrowseViewModel, BaseState>(
        builder: (context, state) {
          if (state is ErrorState) {
            return ErrorStateWidget(
              serverError: state.serverError,
              error: state.error,
            );
            LoadingWidget();
          }
          if (state is SuccessState) {
            List<Genre> categories = state.data ?? [];
            return Padding(
              padding: REdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Browse Category ',
                    style: AppStyle.tabHeader,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (1 / .85),
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                      ),
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          category: categories[index],
                        );
                      },
                      itemCount: categories.length,
                    ),
                  )
                ],
              ),
            );
          }
          return LoadingWidget();
        },
      ),
    );
  }
}
