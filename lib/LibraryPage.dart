import 'package:flutter/material.dart';
import 'CartStore.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<CartItem>>(
      valueListenable: library,
      builder: (context, items, _) {
        if (items.isEmpty) {
          return const Center(
            child: Text("Your library is empty", style: TextStyle(fontSize: 18)),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: Image.asset(
                  "assets/images/${item.image}",
                  width: 80,
                  fit: BoxFit.cover,
                ),
                title: Text(item.title, style: const TextStyle(fontSize: 20)),
                trailing: const Icon(Icons.play_circle_outline),
              ),
            );
          },
        );
      },
    );
  }
}