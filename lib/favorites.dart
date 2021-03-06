import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  var favorites = <WordPair>[];
  Favorites(this.favorites);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(favorites[i].asString),
            );
          }),
    );
  }
}
