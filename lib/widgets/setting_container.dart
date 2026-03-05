import 'package:flutter/material.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';
import 'package:movie_app/widgets/custom_container.dart';

class SettingContainer extends StatelessWidget {
  const SettingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
      height: 330,
      width: 312,
      decoration: BoxDecoration(
        color: AppColors.appBarColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.borderSideColor.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Settings & Preferences",
            style: AppTextStyles.regular18.copyWith(
              color: AppColors.whiteTextColor,
            ),
          ),

          Row(
            children: [
              CustomContainer(
                icon: Icons.dark_mode_outlined,
                text1: "Theme",
                text2: " Dark mode",
              ),
              Spacer(),
              Container(
                height: 32,
                width: 54,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.borderSideColor.withValues(alpha: 0.5),
                  ),
                  color: AppColors.containerColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Light",
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.whiteTextColor.withValues(alpha: 0.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(color: AppColors.borderSideColor.withValues(alpha: 0.5)),
          SizedBox(height: 10),
          CustomContainer(
            icon: Icons.notifications_none_outlined,
            text1: "Notification",
            text2: "Push Notification",
          ),

          CustomContainer(
            icon: Icons.file_download_outlined,
            text1: "Download Quality",
            text2: "HD Quality",
          ),
          CustomContainer(
            icon: Icons.shield_outlined,
            text1: "Privacy",
            text2: "Manage data & privacy",
          ),
        ],
      ),
    );
  }
}
