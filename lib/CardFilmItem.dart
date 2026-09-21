import 'package:flutter/material.dart';
import 'MovieDetails.dart';

class CardFilmItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;

  const CardFilmItem({
    super.key,
    required this.image,
    required this.title,
    this.description = "",
    this.price = "",
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Image.asset(
          "assets/images/$image",
          width: 80,
          fit: BoxFit.cover,
        ),
        title: Text(title, style: const TextStyle(fontSize: 20)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetails(
                image: image,
                title: title,
                description: description,
                price: price,
              ),
            ),
          );
        },
      ),
    );
  }
}