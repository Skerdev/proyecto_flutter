import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('Tu actividad diaria'),
        backgroundColor: const Color(0xFF2E57FF),
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: const FitnessBottomNav(currentIndex: 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWelcomeCard(),
          const SizedBox(height: 16),
          _buildTaskCard(title: 'Rutina de ejercicios', tasks: _exerciseTasks, accent: const Color(0xFFDDE8FF)),
          const SizedBox(height: 16),
          _buildTaskCard(title: 'Dieta diaria', tasks: _dietTasks, accent: const Color(0xFFFFEE9C)),
          const SizedBox(height: 16),
          _buildStatsCard(),
        ],
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(colors: [Color(0xFF355DFF), Color(0xFF7B9DFF)]),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bienvenido Usuario ⭐⭐⭐', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
          SizedBox(height: 8),
          Text('Mantén el ritmo para lograr tus objetivos.', style: TextStyle(color: Colors.white70, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildTaskCard({required String title, required List<_DailyTask> tasks, required Color accent}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: accent, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          ...tasks.map(
            (task) => CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: task.done,
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
      decoration: BoxDecoration(color: const Color(0xFFCAF7AE), borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Progreso del día', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            backgroundColor: Colors.white,
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
