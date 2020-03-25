import 'package:flutter/material.dart';
import 'package:music_player/searchBar.dart';

import 'collectionBox.dart';
import 'musicTile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.red[900],
      ),
      home: MyHomePage(),
    );
  }
}

var blueColor = Color(0xFF090e42);
var pinkColor = Color(0xFFff6b80);

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            SizedBox(height: 32),
            CustomSearchBar(),
            SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Text(
                    "Collections",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                    ),
                  ),
                  SizedBox(height: 10),
                  CollectionList(),
                  SizedBox(height: 30),
                  Text(
                    "Recommended",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                  SizedBox(height: 10),
                  PlayList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollectionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        CollectionBox(
          width: 180,
          height: 150,
          name: "English Rock",
        ),
        CollectionBox(
          width: 180,
          height: 150,
          name: "Classical",
        ),
        CollectionBox(
          width: 180,
          height: 150,
          name: "Dance Mix",
        )
      ],
    );
  }
}

class PlayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MusicTile(
            title: "Shape of You",
            artist: "Mr. X",
            imageurl:
                "https://i.pinimg.com/originals/67/f5/4c/67f54cb98e2da18c991af3771c33f65c.jpg"),
        MusicTile(
          title: "Heart will go on",
          artist: "Diana Grace",
          imageurl: "https://wallpaperaccess.com/full/234315.jpg",
        ),
      ],
    );
  }
}
