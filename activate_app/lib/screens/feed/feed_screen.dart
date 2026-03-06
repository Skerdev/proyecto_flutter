import 'package:flutter/material.dart';

import '../../widgets/fitness_bottom_nav.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      const _Post(
        author: 'Andrea Fit',
        message: 'Hoy completé entrenamiento funcional de 45 minutos. ¡Vamos por más! 💪',
        imageUrl: 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=900&q=80',
      ),
      const _Post(
        author: 'Carlos Runner',
        message: 'Ruta de 10K terminada. Recuerda hidratarte y estirar al finalizar.',
        imageUrl: 'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?auto=format&fit=crop&w=900&q=80',
      ),
      const _Post(
        author: 'Gym Team',
        message: 'Reto del día: 4 series de sentadillas + 20 burpees. ¿Quién se anima?',
        imageUrl: 'https://images.unsplash.com/photo-1579758629938-03607ccdbaba?auto=format&fit=crop&w=900&q=80',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu red social deportiva'),
        backgroundColor: const Color(0xFFDDF2C0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Próximamente podrás crear publicaciones.')),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const FitnessBottomNav(currentIndex: 1),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFF1C5DFF),
                    child: Text(post.author.substring(0, 1), style: const TextStyle(color: Colors.white)),
                  ),
                  title: Text(post.author, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Hace 1 hora'),
                  trailing: const Icon(Icons.more_horiz),
                ),
                Image.network(post.imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(post.message),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Row(
                    children: [
                      Icon(Icons.favorite_border),
                      SizedBox(width: 14),
                      Icon(Icons.mode_comment_outlined),
                      SizedBox(width: 14),
                      Icon(Icons.bookmark_border),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Post {
  const _Post({required this.author, required this.message, required this.imageUrl});

  final String author;
  final String message;
  final String imageUrl;
}
