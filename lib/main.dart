import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/cubit/auth/user_cubit.dart';
import 'package:movie_app/cubit/favourite/favourite_cubit.dart';
import 'package:movie_app/cubit/movie_cubit.dart';
import 'package:movie_app/cubit/navigation%20bar/navigation_cubit.dart';
import 'package:movie_app/cubit/search/search_cubit.dart';
import 'package:movie_app/screens/splash_screen.dart';
import 'package:movie_app/styles/app_colors.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('users');
  await Hive.openBox('currentUser');
  await Hive.openBox('favoriteMovie');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserAuthCubit()..isUserLogged()),
        BlocProvider(create: (_) => NavigationCubit()),
        BlocProvider(create: (_) => FavouriteCubit()..getFavoriteMovies()),
        BlocProvider(create: (_) => MovieCubit()..fetchMovies(dio: Dio())),
        BlocProvider(create: (_) => SearchCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
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
