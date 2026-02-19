import 'package:flutter/material.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';

class LinkedText extends StatelessWidget {
  const LinkedText({
    required this.text1,
    required this.text2,
    super.key,
    required this.ontap,
  });
  final String text1;
  final String text2;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.grayTextColor,
          ),
        ),
        GestureDetector(
          onTap: ontap,
          child: Text(
            text2,
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.buttonsColor,
            ),
          ),
        ),
      ],
    );
  }
}
