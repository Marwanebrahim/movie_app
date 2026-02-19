import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/helpers/image_helper.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';
import 'package:movie_app/widgets/custom_button_widget.dart';
import 'package:movie_app/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageHelper.logoImage),
              Text(
                'Movie Box',
                style: AppTextStyles.bold24.copyWith(
                  color: AppColors.whiteTextColor,
                ),
              ),
              Text(
                'Your ultimate movie discovery platform',
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.grayTextColor,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 320,
                // height: 320,
                decoration: BoxDecoration(
                  color: AppColors.appBarColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18.0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Welcome back",
                        style: AppTextStyles.regular20.copyWith(
                          color: AppColors.whiteTextColor,
                        ),
                      ),
                      Text(
                        "Sign in to your account to continue",
                        style: AppTextStyles.regular16.copyWith(
                          color: AppColors.grayTextColor,
                        ),
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        controller: _emailController,
                        hintText: Text(
                          "Enter your email",
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.borderSideColor,
                          ),
                        ),
                        isPassword: false,
                        validation: (String? p1) {
                          if (p1 == null || p1.isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(p1)) {
                            return 'Please enter a valid email address';
                          }
                          if (p1.length > 50) {
                            return 'Email must be less than 50 characters';
                          }
                          return null;
                        },
                        labelText: 'Email',
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: Text(
                          "Enter your password",
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.borderSideColor,
                          ),
                        ),
                        isPassword: true,
                        validation: (String? p1) {
                          if (p1 == null || p1.isEmpty) {
                            return 'Password is required';
                          }
                          if (p1.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          if (p1.length > 20) {
                            return 'Password must be less than 20 characters';
                          }
                          return null;
                        },
                        labelText: 'Password',
                      ),
                      SizedBox(height: 10),
                      CustomButtonWidget(
                        width: 270,
                        height: 38,
                        borderRadius: 10,
                        color: AppColors.buttonsColor,
                        text: Text(
                          "Sign In",
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.backgroundColor,
                          ),
                        ),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
