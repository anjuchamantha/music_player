import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'songPlayScreen.dart';

class ImageTile extends StatelessWidget {
  final String url;
  ImageTile({this.url});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
        alignment: Alignment.center,
        width: 80,
        height: 80,
        child: FaIcon(
          FontAwesomeIcons.solidPlayCircle,
          color: Colors.white.withOpacity(0.6),
          size: 40,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
              image: NetworkImage(url)),
        ),
      ),
    );
  }
}

class MusicTile extends StatelessWidget {
  final String imageurl;
  final String title;
  final String artist;

  MusicTile({this.imageurl, this.title, this.artist});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ImageTile(
            url: imageurl,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SongPlayScreen(title, artist, imageurl)));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 80,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 8),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),
                    Text(
                      artist,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
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
