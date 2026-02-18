import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/helpers/image_helper.dart';
import 'package:movie_app/screens/home_screen.dart';
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
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ],
        ),
      ),
    );
  }
}
