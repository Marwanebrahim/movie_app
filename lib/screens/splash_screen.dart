import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/cubit/auth/user_cubit.dart';
import 'package:movie_app/cubit/auth/user_state.dart';
import 'package:movie_app/helpers/image_helper.dart';
import 'package:movie_app/screens/app_layout.dart';
import 'package:movie_app/screens/sign/login_screen.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserAuthCubit, UserAuthState>(
      listener: (context, state) {
        if (state is UserAuthLoggedIn || state is UserAuthSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => AppLayout()),
          );
        } else if (state is UserAuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        } else if (state is UserLoggedOut) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<UserAuthCubit>(),
                child: LoginScreen(),
              ),
            ),
          );
        }
      },
      child: Scaffold(
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
            ],
          ),
        ),
      ),
    );
  }
}
