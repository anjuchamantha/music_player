import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SongPlayScreen extends StatelessWidget {
  final String title;
  final String artist;
  final String url;

  SongPlayScreen(this.title, this.artist, this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            height: 500,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.4), Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 50, 15, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "PLAYLIST",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                "Best Vibes of the Week",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Icon(
                            Icons.playlist_add,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      artist,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Slider(
                      activeColor: Colors.red[900],
                      value: 0.2,
                      onChanged: (double value) {},
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '2:10',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                Text(
                  '-3:56',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.backward,
                color: Colors.white,
                size: 34,
              ),
              SizedBox(width: 32),
              FaIcon(
                FontAwesomeIcons.solidPlayCircle,
                color: Colors.red[900],
                size: 70,
              ),
              SizedBox(width: 32),
              FaIcon(
                FontAwesomeIcons.forward,
                color: Colors.white,
                size: 34,
              ),
            ],
          ),
          SizedBox(height: 32),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
              Icon(
                Icons.shuffle,
                color: Colors.white,
              ),
              Icon(
                Icons.repeat,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 32)
        ],
      ),
    );
  }
}
