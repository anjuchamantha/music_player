import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class SongLoader extends ChangeNotifier {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  SongLoader() {
    _getSongMetaData();
  }

  List<SongInfo> _songs = [];
  List<PlaylistInfo> _playlists = [];

  List<SongInfo> get songs => _songs;
  List<PlaylistInfo> get playlists => _playlists;

  void _getSongMetaData() async {
    print('Fetching song data');
    _songs = await audioQuery.getSongs();
    _playlists = await audioQuery.getPlaylists();
    notifyListeners();
  }

  Future<List<SongInfo>> getSongsFromPlaylist(PlaylistInfo playlist) async {
    if (playlist == null) {
      return audioQuery.getSongs();
    } else {
      return audioQuery.getSongsFromPlaylist(playlist: playlist);
    }
  }
}
