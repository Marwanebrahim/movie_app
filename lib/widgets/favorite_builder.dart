import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/favourite/favourite_cubit.dart';
import 'package:movie_app/cubit/favourite/favourite_state.dart';
import 'package:movie_app/cubit/navigation%20bar/navigation_cubit.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';
import 'package:movie_app/widgets/empty_widget.dart';
import 'package:movie_app/widgets/movie_grid.dart';

class FavoriteBuilder extends StatefulWidget {
  const FavoriteBuilder({super.key});

  @override
  State<FavoriteBuilder> createState() => _FavoriteBuilderState();
}

class _FavoriteBuilderState extends State<FavoriteBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteCubit>().getFavoriteMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        if (state is FavouriteLoading || state is FavouriteIntialState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is FavouriteLoaded) {
          return state.favoriteMovies.isNotEmpty
              ? MovieGrid(movies: state.favoriteMovies)
              : BlocBuilder<NavigationCubit, int>(
                  builder: (context, state) => EmptyWidget(
                    icon: Icons.favorite_border_outlined,
                    buttonText: Text(
                      "Discover Movies",
                      style: AppTextStyles.regular16.copyWith(
                        color: AppColors.backgroundColor,
                      ),
                    ),
                    onTap: () {
                      context.read<NavigationCubit>().changePage(0);
                    },
                    isFav: true,
                    firstText: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text(
                        "Start exploring movies and add them to your favorites \n             by tapping the heart icon.",
                        style: AppTextStyles.regular16.copyWith(
                          color: AppColors.grayTextColor,
                        ),
                      ),
                    ),
                  ),
                );
        }
        if (state is FavouriteErrorState) {
          return Text(
            state.errorMessage,
            style: AppTextStyles.bold26.copyWith(color: Colors.white),
          );
        }
        return Text(
          "error",
          style: AppTextStyles.bold26.copyWith(color: Colors.white),
        );
      },
    );
  }
}
