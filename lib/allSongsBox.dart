import 'package:flutter/material.dart';
import 'package:music_player/playlistScreen.dart';

class AllSongsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaylistScreen(
                      playlistInfo: null,
                      img: null,
                    ),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.bottomRight,
                width: 170,
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "All songs",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      image: NetworkImage(
                          "https://i.pinimg.com/originals/67/f5/4c/67f54cb98e2da18c991af3771c33f65c.jpg")),
                ),
              ),
            ),
          ),
          // MusicTile(
          //     title: "Shape of You",
          //     artist: "Mr. X",
          //     imageurl:
          //         "https://i.pinimg.com/originals/67/f5/4c/67f54cb98e2da18c991af3771c33f65c.jpg"),
          // MusicTile(
          //   title: "Heart will go on",
          //   artist: "Diana Grace",
          //   imageurl: "https://wallpaperaccess.com/full/234315.jpg",
          // ),
        ],
      ),
    );
  }
}
