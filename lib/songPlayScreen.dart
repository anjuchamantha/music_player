import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SongPlayScreen extends StatelessWidget {
  final SongInfo songInfo;
  final Image image;
  final AudioPlayer audioPlayer = AudioPlayer(playerId: 'qwyebk2bhe1ky2');

  SongPlayScreen(this.songInfo, this.image);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            height: screenHeight * .5,
            // height: 500,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    image: DecorationImage(
                      image: image.image,
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        songInfo.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Text(
                      songInfo.artist,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
          Slider(
            activeColor: Colors.red[900],
            value: 0.2,
            onChanged: (double value) {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '2.11',
                  // audioPlayer.getCurrentPosition().toString(),
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                Text(
                  '-3:56',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
              ],
            ),
          ),
          Spacer(),
          // SizedBox(height: screenHeight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.backward,
                  color: Colors.white,
                  size: 34,
                ),
              ),
              Container(
                width: 120,
                height: 120,
                child: IconButton(
                  onPressed: () {
                    audioPlayer.play(songInfo.filePath);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.solidPlayCircle,
                    color: Colors.red[900],
                    size: 75,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.forward,
                  color: Colors.white,
                  size: 34,
                ),
              ),
            ],
          ),
          // SizedBox(height: 32),
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
