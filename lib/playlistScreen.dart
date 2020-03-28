import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/musicTile.dart';
import 'package:music_player/song_loader.dart';
import 'package:provider/provider.dart';

class PlaylistScreen extends StatelessWidget {
  final PlaylistInfo playlistInfo;
  final ImageProvider img;

  PlaylistScreen(this.playlistInfo, this.img);

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
              playlistInfo.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.4),
            ),
            SizedBox(height: 16),
            Consumer<SongLoader>(
              builder: (context, songLoader, _) => FutureBuilder(
                future: songLoader.getSongsFromPlaylist(playlistInfo),
                builder: (context, dataSnapshot) {
                  if (dataSnapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: dataSnapshot.data.length,
                        itemBuilder: (_, index) => MusicTile(
                          songInfo: dataSnapshot.data[index],
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(80.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
