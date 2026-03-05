import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/models/user.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';

class DisplayUserInfo extends StatelessWidget {
  const DisplayUserInfo({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(gradient: AppColors.containerGradientColor),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteTextColor.withValues(alpha: 0.1),
              border: Border.all(color: AppColors.whiteTextColor, width: 1),
            ),
            child: Center(
              child: Text(
                user.fullName.substring(0, 1).toUpperCase(),
                style: AppTextStyles.bold26.copyWith(
                  color: AppColors.whiteTextColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName,
                style: AppTextStyles.bold26.copyWith(
                  color: AppColors.whiteTextColor,
                ),
              ),
              Text(
                user.email,
                style: AppTextStyles.regular18.copyWith(
                  color: AppColors.whiteTextColor,
                ),
              ),
              Row(
                spacing: 8,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.whiteTextColor,
                    size: 18,
                  ),
                  Text(
                    "Member since ${formateDate(user.createdTime)}",
                    style: AppTextStyles.regular18.copyWith(
                      color: AppColors.whiteTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formateDate(DateTime date) {
    return DateFormat('MMMM yyyy').format(date);
  }
}
