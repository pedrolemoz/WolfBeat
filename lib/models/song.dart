import 'package:flutter/foundation.dart';

class Song {
  Song({
    @required this.title,
    @required this.artist,
    @required this.album,
    @required this.artworkURL,
    @required this.duration,
    @required this.genre,
    @required this.songURL,
    @required this.backgroundColor,
  });

  final String title;
  final String artist;
  final String album;
  final String artworkURL;
  final String genre;
  final int duration;
  final String songURL;
  final String backgroundColor;
}
