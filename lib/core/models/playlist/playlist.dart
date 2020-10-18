import 'package:flutter/foundation.dart';

import '../../exceptions/null_attribute_exception.dart';
import '../song/song.dart';

class Playlist {
  Playlist({
    @required this.playlistName,
    @required this.songs,
  })  : assert(
            playlistName != null, throw NullAttributeException('playlistName')),
        assert(songs != null, throw NullAttributeException('songs')) {
    songs.sort((a, b) => a.title.compareTo(b.title));
  }

  final String playlistName;

  List<Song> songs;

  Playlist copyWith({
    String playlistName,
    List<Song> songs,
  }) {
    return Playlist(
      playlistName: playlistName ?? this.playlistName,
      songs: songs ?? this.songs,
    );
  }
}
