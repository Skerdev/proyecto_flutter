import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/fitness_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<_DailyTask> _exerciseTasks = [
    _DailyTask('Trotar 15 minutos'),
    _DailyTask('Plancha 1 minuto'),
    _DailyTask('Push ups x 50'),
    _DailyTask('5 min de estiramientos'),
  ];

  final List<_DailyTask> _dietTasks = [
    _DailyTask('2 litros de agua'),
    _DailyTask('Verduras en el almuerzo'),
    _DailyTask('Avena integral'),
    _DailyTask('Cena con proteína'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fit Colombia · Inicio')),
      bottomNavigationBar: const FitnessBottomNav(currentIndex: 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWelcomeCard(),
          const SizedBox(height: 16),
          _buildTaskCard(title: 'Rutina de ejercicios', tasks: _exerciseTasks),
          const SizedBox(height: 16),
          _buildTaskCard(title: 'Plan de nutrición', tasks: _dietTasks),
          const SizedBox(height: 16),
          _buildStatsCard(),
        ],
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¡Bienvenido a Fit Colombia!',
            style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 6),
          Text(
            'Tu progreso de hoy está listo para continuar.',
            style: TextStyle(color: AppColors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard({required String title, required List<_DailyTask> tasks}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          ...tasks.map(
            (task) => CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: task.done,
              activeColor: AppColors.primaryBlue,
              title: Text(task.title),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) => setState(() => task.done = value ?? false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard() {
    final completed = _exerciseTasks.where((e) => e.done).length + _dietTasks.where((e) => e.done).length;
    final total = _exerciseTasks.length + _dietTasks.length;
    final progress = total == 0 ? 0.0 : completed / total;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Progreso del día', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            backgroundColor: const Color(0xFFD6EDF7),
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          const SizedBox(height: 8),
          Text('$completed de $total actividades completadas'),
        ],
      ),
    );
  }
}

class _DailyTask {
  _DailyTask(this.title);

  final String title;
  bool done = false;
}
