import 'package:WolfBeat/core/exceptions/null_attribute_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Playlist {
  Playlist({
    @required this.playlistName,
    @required this.songs,
  })  : assert(
            playlistName != null, throw NullAttributeException('playlistName')),
        assert(songs != null, throw NullAttributeException('songs'));

  final String playlistName;

  final List songs;

  Playlist copyWith({
    String playlistName,
    List songs,
  }) {
    return Playlist(
      playlistName: playlistName ?? this.playlistName,
      songs: songs ?? this.songs,
    );
  }
}
