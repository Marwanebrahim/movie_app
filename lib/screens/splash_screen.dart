import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/cubit/auth/user_cubit.dart';
import 'package:movie_app/helpers/image_helper.dart';
import 'package:movie_app/screens/app_layout.dart';
import 'package:movie_app/screens/sign/login_screen.dart';
import 'package:movie_app/services/user/user_auth_service.dart';
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
    _checkAndNavigate();
  }

  Future<void> _checkAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    final user = await UserAuthService().getCurrentUser();

    if (!mounted) return;

    if (user != null) {
      context.read<UserAuthCubit>().isUserLogged();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => AppLayout()),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: context.read<UserAuthCubit>(),
            child: LoginScreen(),
          ),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
