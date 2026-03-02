import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/favourite/favourite_cubit.dart';
import 'package:movie_app/cubit/favourite/favourite_state.dart';
import 'package:movie_app/cubit/movie_cubit.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/widgets/movie_card.dart';

class MovieGrid extends StatelessWidget {
  const MovieGrid({super.key, required this.movies});
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.containerColor,
      padding: const EdgeInsets.only(top: 1.5, bottom: 1.5),
      child: Container(
        color: AppColors.backgroundColor,
        child: GridView.builder(
          padding: EdgeInsets.only(top: 16, left: 6, right: 6),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
            childAspectRatio: 0.52,
          ),
          itemCount: movies.length,
          physics: const BouncingScrollPhysics(),

          itemBuilder: (context, index) {
            final movie = movies[index];
            final favMovies =
                context.read<FavouriteCubit>().state is FavouriteLoaded
                ? (context.read<FavouriteCubit>().state as FavouriteLoaded)
                      .favoriteMovies
                : [];

            for (var movie in movies) {
              movie.isFavorite = favMovies.any((fav) => fav.id == movie.id);
            }
            return MovieCard(
              movie: movie,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                          value: context.read<FavouriteCubit>(),
                        ),
                        BlocProvider.value(value: context.read<MovieCubit>()),
                      ],
                      child: MovieDetails(movie: movie),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
