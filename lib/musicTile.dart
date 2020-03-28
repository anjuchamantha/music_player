import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_color/random_color.dart';

import 'songPlayScreen.dart';

class ImageTile extends StatelessWidget {
  final Image image;
  final RandomColor _randomColor = RandomColor();

  ImageTile({this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
        alignment: Alignment.center,
        width: 60,
        height: 60,
        child: FaIcon(
          FontAwesomeIcons.solidPlayCircle,
          color: Colors.white.withOpacity(0.6),
          size: 40,
        ),
        decoration: BoxDecoration(
          color: _randomColor.randomColor().withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
              image: image.image),
        ),
      ),
    );
  }
}

class MusicTile extends StatelessWidget {
  final SongInfo songInfo;
  final Random random = new Random();

  MusicTile({this.songInfo});

  static Image getAlbumArt(SongInfo songInfo, String url) {
    try {
      return Image.file(
        File(songInfo.albumArtwork),
      );
    } catch (e) {
      print(
          "=================================================================================================");
      print(songInfo);
      print(e);
      print("type : " + (songInfo.albumArtwork).runtimeType.toString());
      print(
          "=================================================================================================");
      return Image(
        image: NetworkImage(
            "https://www.freepnglogos.com/uploads/music-logo-black-and-white-png-21.png"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int randomNumber = random.nextInt(50);
    String _imageurl = "https://picsum.photos/250?image=$randomNumber";
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ImageTile(image: getAlbumArt(songInfo, _imageurl)),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SongPlayScreen(songInfo, _imageurl)));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 60,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 8),
                    Text(
                      songInfo.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),
                    Text(
                      songInfo.artist,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          FaIcon(
            FontAwesomeIcons.ellipsisV,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
    );
  }
}
