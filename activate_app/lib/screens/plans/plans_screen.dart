import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/fit_colombia_logo.dart';
import '../../widgets/fitness_bottom_nav.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plans = [
      const _Plan(
        name: 'Plan Basic',
        price: 'Gratis',
        isCurrent: true,
        benefits: [
          'Acceso al feed deportivo',
          'Rutinas diarias básicas',
          'Seguimiento básico del progreso',
        ],
      ),
      const _Plan(
        name: 'Plan Plata',
        price: r'$10 USD/mes',
        benefits: [
          'Sin anuncios en la app',
          'Más herramientas de entrenamiento',
          'Tutor IA ficticia por hora',
        ],
      ),
      const _Plan(
        name: 'Plan Oro',
        price: r'$20 USD/mes',
        benefits: [
          'Todo lo de Plan Plata',
          'Tutores reales disponibles',
          'Mayor personalización de ejercicios',
        ],
      ),
      const _Plan(
        name: 'Plan Diamante',
        price: r'$100 USD/mes',
        benefits: [
          'Todo lo de Plan Oro',
          'Acceso a gimnasios aliados de Bogotá (demo)',
          'Soporte premium y plan avanzado',
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Fit Colombia · Planes')),
      bottomNavigationBar: const FitnessBottomNav(currentIndex: 2),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(18)),
            child: const Row(
              children: [
                FitColombiaLogo(size: 76),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Estás actualmente en Plan Basic',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          ...plans.map(_buildPlanCard),
        ],
      ),
    );
  }

  Widget _buildPlanCard(_Plan plan) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: plan.isCurrent ? AppColors.primaryBlue : const Color(0xFFE4E4E4),
          width: plan.isCurrent ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(plan.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                ),
                Text(
                  plan.price,
                  style: const TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ],
            ),
            if (plan.isCurrent)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text('Plan actual', style: TextStyle(color: AppColors.white)),
              ),
            const SizedBox(height: 10),
            ...plan.benefits.map(
              (benefit) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(Icons.check_circle, size: 18, color: AppColors.primaryBlue),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(benefit)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Plan {
  const _Plan({required this.name, required this.price, required this.benefits, this.isCurrent = false});

  final String name;
  final String price;
  final List<String> benefits;
  final bool isCurrent;
}
