import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class FitColombiaLogo extends StatelessWidget {
  const FitColombiaLogo({super.key, this.size = 120});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(color: AppColors.black, shape: BoxShape.circle),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.fitness_center, color: AppColors.white, size: size * 0.22),
          const SizedBox(height: 6),
          Text(
            'FIT',
            style: TextStyle(
              color: AppColors.white,
              fontSize: size * 0.22,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
              height: 1,
            ),
          ),
          Text(
            'COLOMBIA',
            style: TextStyle(
              color: AppColors.white,
              fontSize: size * 0.09,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
