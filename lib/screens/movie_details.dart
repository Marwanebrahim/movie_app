import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/helpers/image_helper.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';
import 'package:movie_app/widgets/custom_button_widget.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        foregroundColor: AppColors.grayTextColor,
        title: Text(
          "Movie Details",
          style: AppTextStyles.semibold18.copyWith(
            color: AppColors.grayTextColor,
          ),
        ),
      ),

      body: Column(
        children: [
          Stack(
            alignment: AlignmentGeometry.bottomLeft,
            children: [
              SizedBox(
                height: 260,
                width: double.infinity,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movie.title ?? "No Title",
                      style: AppTextStyles.bold28.copyWith(
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      spacing: 16,
                      children: [
                        Text(
                          movie.releaseDate?.substring(0, 4) ?? "999",
                          style: AppTextStyles.regular16.copyWith(
                            color: AppColors.whiteTextColor,
                          ),
                        ),
                        Text(
                          ".",
                          style: AppTextStyles.semibold16.copyWith(
                            color: AppColors.whiteTextColor,
                          ),
                        ),
                        Text(
                          "Fantasy",
                          style: AppTextStyles.regular16.copyWith(
                            color: AppColors.whiteTextColor,
                          ),
                        ),
                        Text(
                          ".",
                          style: AppTextStyles.semibold16.copyWith(
                            color: AppColors.whiteTextColor,
                          ),
                        ),
                        Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.whiteTextColor,
                        ),
                        Text(
                          "2h 32m",
                          style: AppTextStyles.regular16.copyWith(
                            color: AppColors.whiteTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                SvgPicture.asset(ImageHelper.starIcon, width: 22, height: 22),
                SizedBox(width: 4),
                Text(
                  movie.voteAverage?.toInt().toString() ?? "0",
                  style: AppTextStyles.semibold18.copyWith(
                    color: AppColors.whiteTextColor,
                  ),
                ),
                Text(
                  "/ 10",
                  style: AppTextStyles.semibold16.copyWith(
                    color: AppColors.grayTextColor,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButtonWidget(
                width: 152,
                height: 36,
                borderRadius: 14,
                color: AppColors.buttonsColor,
                text: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border_outlined,
                      color: AppColors.whiteTextColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Add to Favorites",
                      style: AppTextStyles.regular16.copyWith(
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              ),
              CustomButtonWidget(
                width: 152,
                height: 36,
                borderRadius: 14,
                color: AppColors.borderSideColor,
                text: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.share_outlined, color: AppColors.whiteTextColor),
                    const SizedBox(width: 8),
                    Text(
                      "Share",
                      style: AppTextStyles.regular16.copyWith(
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Synopsis",
                  style: AppTextStyles.semibold24.copyWith(
                    color: AppColors.whiteTextColor,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  movie.overview ?? "",
                  style: AppTextStyles.regular18.copyWith(
                    color: AppColors.grayTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
