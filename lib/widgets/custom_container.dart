import 'package:flutter/material.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2,
  });
  final IconData icon;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.borderSideColor.withValues(alpha: 0.5),
            ),
            color: AppColors.containerColor.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: AppColors.whiteTextColor.withValues(alpha: 0.95),
            size: 18,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: AppTextStyles.regular14.copyWith(
                color: AppColors.whiteTextColor.withValues(alpha: 0.85),
              ),
            ),
            Text(
              text2,
              style: AppTextStyles.regular14.copyWith(
                color: AppColors.grayTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
