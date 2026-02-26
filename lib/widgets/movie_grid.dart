import 'package:flutter/material.dart';
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
            return MovieCard(
              movie: movie,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(movie: movie),
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
