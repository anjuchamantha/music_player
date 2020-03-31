import 'package:flutter/material.dart';
import 'package:music_player/allSongsBox.dart';
import 'package:music_player/core/musicPlayerCore.dart';
import 'package:music_player/core/song_loader.dart';
import 'package:music_player/playlistBox.dart';
import 'package:music_player/searchBar.dart';
import 'package:provider/provider.dart';

import 'musicTile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SongLoader(),
        ),
        ChangeNotifierProvider(
          create: (_) => MusicPlayerCore(),
        ),
      ],
      child: MaterialApp(
        title: 'Music Player Screen',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.red[900],
        ),
        home: MyHomePage(),
      ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Playlists",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                    ),
                  ),
                  SizedBox(height: 10),
                  Playlists(),
                  SizedBox(height: 30),
                  Text(
                    "Favourites",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                  SizedBox(height: 10),
                  AllSongsBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Playlists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<SongLoader>(
        builder: (context, playListLoader, _) => ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: playListLoader.playlists.length,
          itemBuilder: (_, index) => PlayListBox(
            playlistInfo: playListLoader.playlists[index],
            index: index,
          ),
        ),
      ),
    );
  }
}
