import 'package:flutter/material.dart';
import 'main.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites Page"),
        backgroundColor: Colors.green,
      ),
      //drawer: NavigationDrawer(),
    );
  }
}
