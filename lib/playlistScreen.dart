import 'package:flutter/material.dart';
import 'package:music_player/musicTile.dart';

class PlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 45),
            Text(
              "All Songs",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.4),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: <Widget>[
                  MusicTile(
                    imageurl: null,
                    artist: "Mr. Y",
                    title: "Hello Mr Y",
                  ),
                  MusicTile(
                    imageurl: null,
                    artist: "John Doe",
                    title: "My name is Khan",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
