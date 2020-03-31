import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/core/musicPlayerCore.dart';
import 'package:provider/provider.dart';

class TimeSlider extends StatelessWidget {
  final AudioPlayer audioPlayer;
  TimeSlider({Key key, this.audioPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MusicPlayerCore player = Provider.of<MusicPlayerCore>(context);
    final double duration = player.currentSong != null
        ? double.parse(player.currentSong.duration)
        : 1.0;

    return StreamBuilder<Duration>(
        stream: audioPlayer.onAudioPositionChanged,
        builder: (context, p) {
          double current = 0.0;
          if (p.hasData) {
            current = p.data.inMilliseconds.toDouble();
          }

          double value = current / duration;
          // print(value.toString() + " && " + duration.toString());

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Slider(
                  activeColor: Colors.red[900],
                  value: value > 1.0 ? 0.0 : value,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (double val) => {
                        duration != 1.0
                            ? audioPlayer.seek(Duration(
                                milliseconds: (duration * val).toInt()))
                            : null
                      }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      Duration(milliseconds: (value * duration).toInt())
                          .toString()
                          .substring(2, 7),
                      // audioPlayer.getCurrentPosition().toString(),
                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    ),
                    Text(
                      Duration(milliseconds: duration.toInt())
                          .toString()
                          .substring(2, 7),
                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
