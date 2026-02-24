import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/cubit/auth/user_cubit.dart';
import 'package:movie_app/screens/splash_screen.dart';
import 'package:movie_app/styles/app_colors.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('users');
  await Hive.openBox('currentUser');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserAuthCubit()..isUserLogged(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.appBarColor,
            selectedItemColor: AppColors.buttonsColor,
            unselectedItemColor: AppColors.grayTextColor,
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
