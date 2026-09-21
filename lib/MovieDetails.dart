import 'package:flutter/material.dart';
import 'CartStore.dart';

class MovieDetails extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;

  const MovieDetails({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              "assets/images/$image",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Text(
              price,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                addToCart(CartItem(image: image, title: title));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$title added to cart")),
                );
              },
              icon: const Icon(Icons.shopping_basket),
              label: const Text("Acheter"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}