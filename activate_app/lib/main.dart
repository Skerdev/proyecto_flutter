import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'screens/feed/feed_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/plans/plans_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const FitColombiaApp());
}

class FitColombiaApp extends StatelessWidget {
  const FitColombiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fit Colombia',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryBlue,
          primary: AppColors.primaryBlue,
          surface: AppColors.white,
          onPrimary: AppColors.white,
          onSurface: AppColors.black,
        ),
        scaffoldBackgroundColor: AppColors.softBlue,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.feed: (context) => const FeedScreen(),
        AppRoutes.plans: (context) => const PlansScreen(),
      },
    );
  }
}
