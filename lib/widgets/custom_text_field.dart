import 'package:flutter/material.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isPassword,
    required this.validation,
    required this.labelText,
  });
  final String labelText;
  final TextEditingController controller;
  final Widget hintText;
  final bool isPassword;
  final String? Function(String?)? validation;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.labelText,
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.whiteTextColor,
            ),
          ),
        ),

        SizedBox(
          height: 40,
          width: 270,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword && !isPasswordVisible,
            validator: widget.validation,
            style: AppTextStyles.regular16.copyWith(
              color: AppColors.borderSideColor,
            ),
            decoration: InputDecoration(
              hint: widget.hintText,
              filled: true,
              fillColor: AppColors.fillTextFieldColor.withValues(alpha: 0.5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.borderSideColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.borderSideColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.errorBorderColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.errorBorderColor),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        isPasswordVisible = !isPasswordVisible;
                        setState(() {});
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
