import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player/core/musicPlayerCore.dart';
import 'package:music_player/time_slider.dart';
import 'package:provider/provider.dart';

class SongPlayScreen extends StatelessWidget {
  // final PlaylistInfo playlistInfo;
  final Image image;

  SongPlayScreen(this.image);

  @override
  Widget build(BuildContext context) {
    final MusicPlayerCore player = Provider.of<MusicPlayerCore>(context);

    SongInfo songInfo = player.currentSong;
    // SongInfo songInfo = playlist[index];
    // Image image = songInfo.albumArtwork;

    double screenHeight = MediaQuery.of(context).size.height;
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            height: screenHeight * .5,
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
                                "ALBUM",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                songInfo.album,
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
          TimeSlider(audioPlayer: player.audioPlayer),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  player.prevSong();
                },
                icon: FaIcon(
                  FontAwesomeIcons.backward,
                  color: Colors.white,
                  size: 34,
                ),
              ),
              PlayButton(audioPlayer: player.audioPlayer),
              IconButton(
                onPressed: () {
                  player.nextSong();
                },
                icon: FaIcon(
                  FontAwesomeIcons.forward,
                  color: Colors.white,
                  size: 34,
                ),
              ),
            ],
          ),
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

class PlayButton extends StatelessWidget {
  final AudioPlayer audioPlayer;

  const PlayButton({
    @required this.audioPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      child: StreamBuilder(
          stream: audioPlayer.onPlayerStateChanged,
          builder: (context, playerState) {
            return IconButton(
              onPressed: () {
                // print("Song index : $index");
                Provider.of<MusicPlayerCore>(context, listen: false).play();
              },
              icon: (playerState.data == AudioPlayerState.PLAYING)
                  ? FaIcon(
                      FontAwesomeIcons.solidPauseCircle,
                      color: Colors.red[900],
                      size: 75,
                    )
                  : FaIcon(
                      FontAwesomeIcons.solidPlayCircle,
                      color: Colors.red[900],
                      size: 75,
                    ),
            );
          }),
    );
  }
}
