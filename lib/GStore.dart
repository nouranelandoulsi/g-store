import 'package:flutter/material.dart';
import 'CardFilmItem.dart';
import 'CartPage.dart';

class GStore extends StatefulWidget {
  const GStore({super.key});

  @override
  State<GStore> createState() => _GStoreState();
}

class _GStoreState extends State<GStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("G-STORE"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CardFilmItem(
              image: "iceroad.jpg",
              title: "Ice Road",
              description:
              "A crew of ice road truckers must haul supplies across a frozen lake to rescue miners trapped after a mine collapse.",
              price: "250 DT",
            ),
            CardFilmItem(
              image: "thegrudge.jpg",
              title: "The grudge",
              description:
              "A nurse in Tokyo becomes cursed after entering a house haunted by a vengeful spirit, and the curse spreads to everyone she meets.",
              price: "200 DT",
            ),
            CardFilmItem(
              image: "HouseOfDead.jpg",
              title: "House Of Dead",
              description:
              "The House of the Dead and its 2022 remake take place in 1998, following AMS agents Thomas Rogan and G as they raid the mansion of Dr. Curien, a genetic engineer who went insane and has released creatures upon his own research team.",
              price: "300 DT",
            ),
          ],
        ),
      ),
    );
  }
}