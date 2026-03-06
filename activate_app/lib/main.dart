import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'screens/feed/feed_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(const ActivateApp());
}

class ActivateApp extends StatelessWidget {
  const ActivateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Activate App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1C5DFF)),
        scaffoldBackgroundColor: const Color(0xFFF2F5FF),
      ),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.feed: (context) => const FeedScreen(),
      },
    );
  }
}
