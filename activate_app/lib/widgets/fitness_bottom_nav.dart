import 'package:flutter/material.dart';

import '../routes/app_routes.dart' as app_routes;
import '../theme/app_colors.dart';

class FitnessBottomNav extends StatelessWidget {
  const FitnessBottomNav({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      backgroundColor: AppColors.white,
      indicatorColor: AppColors.primaryBlue,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      onDestinationSelected: (index) {
        if (index == currentIndex) return;

        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, app_routes.AppRoutes.home);
            return;
          case 1:
            Navigator.pushReplacementNamed(context, app_routes.AppRoutes.feed);
            return;
          case 2:
            Navigator.pushReplacementNamed(context, app_routes.AppRoutes.plans);
            return;
        }
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Inicio'),
        NavigationDestination(icon: Icon(Icons.dynamic_feed_outlined), label: 'Feed'),
        NavigationDestination(icon: Icon(Icons.workspace_premium_outlined), label: 'Planes'),
      ],
    );
  }
}
