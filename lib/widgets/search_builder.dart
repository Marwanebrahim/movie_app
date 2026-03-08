import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/search/search_cubit.dart';
import 'package:movie_app/cubit/search/search_state.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';
import 'package:movie_app/widgets/empty_widget.dart';
import 'package:movie_app/widgets/movie_grid.dart';
import 'package:movie_app/widgets/search_bar_widget.dart';

class SearchBuilder extends StatefulWidget {
  const SearchBuilder({super.key});

  @override
  State<SearchBuilder> createState() => _SearchBuilderState();
}

class _SearchBuilderState extends State<SearchBuilder> {
  final TextEditingController controller = .new();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onSearchChanged({required String query}) {
    Future.delayed(const Duration(milliseconds: 400), () {
      if (controller.text == query) {
        if (mounted) {
          context.read<SearchCubit>().searchMovies(query: query, dio: Dio());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarWidget(
          controller: controller,
          onSearchChanged: (query) => _onSearchChanged(query: query),
        ),
        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchInitial) {
                return EmptyWidget(
                  icon: Icons.search,
                  isFav: false,
                  firstText: Text(
                    "Discover Movies",
                    style: AppTextStyles.regular16.copyWith(
                      color: AppColors.whiteTextColor,
                    ),
                  ),
                  secondText: Text(
                    "Search for your favorite movies and discover new ones",
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.grayTextColor,
                    ),
                  ),
                );
              }

              if (state is SearchLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is SearchEmpty) {
                return SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: EmptyWidget(
                      icon: Icons.search_off_outlined,
                      isFav: false,
                      firstText: Text(
                        "No results found",
                        style: AppTextStyles.regular16.copyWith(
                          color: AppColors.whiteTextColor,
                        ),
                      ),
                    ),
                  ),
                );
              }

              if (state is SearchError) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: AppTextStyles.regular16.copyWith(color: Colors.red),
                  ),
                );
              }

              if (state is SearchLoaded) {
                return MovieGrid(movies: state.movies);
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
