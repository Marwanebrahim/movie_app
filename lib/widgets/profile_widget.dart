import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/cubit/auth/user_cubit.dart';
import 'package:movie_app/helpers/image_helper.dart';
import 'package:movie_app/models/user.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';
import 'package:movie_app/widgets/custom_button_widget.dart';
import 'package:movie_app/widgets/display_user_info.dart';
import 'package:movie_app/widgets/setting_container.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          DisplayUserInfo(user: user),
          const SizedBox(height: 20),
          SettingContainer(),
          const SizedBox(height: 16),
          Container(
            height: 110,
            width: 312,
            decoration: BoxDecoration(
              color: AppColors.appBarColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.borderSideColor.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),

              child: Column(
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      SvgPicture.asset(
                        ImageHelper.logoImage,
                        height: 40,
                        width: 40,
                      ),

                      Column(
                        children: [
                          Text(
                            "MovieBox",
                            style: AppTextStyles.regular16.copyWith(
                              color: AppColors.whiteTextColor.withValues(
                                alpha: 0.85,
                              ),
                            ),
                          ),
                          Text(
                            "Version 1.0.0",
                            style: AppTextStyles.regular12.copyWith(
                              color: AppColors.grayTextColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.help_outline_rounded,
                        size: 16,
                        color: AppColors.grayTextColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Help & Support",
                        style: AppTextStyles.regular12.copyWith(
                          color: AppColors.grayTextColor,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.share_outlined,
                        size: 16,
                        color: AppColors.grayTextColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Share App",
                        style: AppTextStyles.regular12.copyWith(
                          color: AppColors.grayTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 78,
            width: 312,
            decoration: BoxDecoration(
              color: AppColors.appBarColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.containerColor.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            child: CustomButtonWidget(
              width: 254,
              height: 36,
              borderRadius: 8,
              color: AppColors.containerColor.withValues(alpha: 0.5),
              text: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: AppColors.errorBorderColor.withValues(alpha: 0.8),
                  ),
                  Text(
                    "Logout",
                    style: AppTextStyles.regular16.copyWith(
                      color: AppColors.errorBorderColor.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
              onTap: () {
                context.read<UserAuthCubit>().logout();
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
