import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/helpers/image_helper.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie, required this.onTap});
  final Movie movie;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: 240,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.appBarColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                height: 144,
                width: 96,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                movie.title ?? "No Title",
                style: AppTextStyles.semibold16.copyWith(
                  color: AppColors.whiteTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageHelper.starIcon, width: 16, height: 16),
                  SizedBox(width: 4),
                  Text(
                    movie.voteAverage?.toInt().toString() ?? "0",
                    style: AppTextStyles.semibold14.copyWith(
                      color: AppColors.grayTextColor,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    movie.releaseDate?.substring(0, 4) ?? "999",
                    style: AppTextStyles.semibold12.copyWith(
                      color: AppColors.grayTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
