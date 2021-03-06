import 'package:first_app/favorites.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Word generator", home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  var array = <WordPair>[];

  var favorites = <WordPair>[];

  var alreadySaved;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Favorites(favorites)));
          },
          child: Icon(Icons.list),
        ),
        appBar: AppBar(
          title: Text("Word Generator"),
        ),
        body: buildList());
  }

  Widget buildList() {
    return ListView.builder(itemBuilder: (context, i) {
      array.addAll(generateWordPairs().take(1));
      alreadySaved = favorites.contains(array[i]);

      return ListTile(
        title: Text(array[i].asString),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_outline,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved)
              favorites.remove(array[i]);
            else
              favorites.add(array[i]);
          });
        },
      );
    });
  }
}
