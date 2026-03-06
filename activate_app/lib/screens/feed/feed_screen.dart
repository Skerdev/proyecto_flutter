import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/fitness_bottom_nav.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      const _Post(
        author: 'Andrea Fit',
        message: 'Completé 45 min de funcional. Hoy gané resistencia 💪',
        imageUrl: 'https://images.pexels.com/photos/1552242/pexels-photo-1552242.jpeg?auto=compress&cs=tinysrgb&w=1200',
      ),
      const _Post(
        author: 'Carlos Runner',
        message: '10K finalizados. Hidratación + estiramiento obligatorio ✅',
        imageUrl: 'https://images.pexels.com/photos/2402777/pexels-photo-2402777.jpeg?auto=compress&cs=tinysrgb&w=1200',
      ),
      const _Post(
        author: 'Gym Team Bogotá',
        message: 'Reto: 4 series de sentadillas + 20 burpees. ¿Te unes?',
        imageUrl: 'https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&w=1200',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Fit Colombia · Feed')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
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
            color: AppColors.white,
            margin: const EdgeInsets.only(bottom: 14),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primaryBlue,
                    child: Text(post.author.substring(0, 1), style: const TextStyle(color: AppColors.white)),
                  ),
                  title: Text(post.author, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Hace 1 hora'),
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