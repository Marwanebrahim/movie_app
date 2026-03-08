import 'package:flutter/material.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/widgets/custom_button_widget.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.icon,
    this.buttonText,
    this.onTap,
    required this.isFav,
    required this.firstText,
    this.secondText,
  });
  final bool isFav;
  final IconData icon;
  final Widget firstText;
  final Widget? secondText;
  final Widget? buttonText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.fillTextFieldColor,
            radius: 40,
            foregroundColor: AppColors.grayTextColor,
            child: Icon(icon),
          ),
          firstText,
          ?isFav
              ? CustomButtonWidget(
                  width: 136,
                  height: 36,
                  borderRadius: 8,
                  color: AppColors.buttonsColor,
                  text: buttonText!,
                  onTap: onTap!,
                )
              : secondText,
        ],
      ),
    );
  }
}
