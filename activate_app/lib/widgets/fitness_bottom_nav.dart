import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class FitnessBottomNav extends StatelessWidget {
  const FitnessBottomNav({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      backgroundColor: const Color(0xFF1C5DFF),
      indicatorColor: const Color(0xFFCBF865),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      onDestinationSelected: (index) {
        if (index == currentIndex) return;

        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.home);
            return;
          case 1:
            Navigator.pushReplacementNamed(context, AppRoutes.feed);
            return;
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('La pantalla de perfil estará disponible pronto.'),
              ),
            );
        }
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.explore_outlined), label: 'Explore'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'Perfil'),
      ],
    );
  }
}
