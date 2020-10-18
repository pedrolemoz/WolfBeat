import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../exceptions/null_attribute_exception.dart';

/// [Song] is a class that represents the song object.
/// Used in [MusicTile], [PlayerController], [SearchController], [SongsController].
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
    @required this.reference,
    this.isFavorite = false,
  })  : assert(title != null, throw NullAttributeException('title')),
        assert(artist != null, throw NullAttributeException('artist')),
        assert(album != null, throw NullAttributeException('album')),
        assert(artworkURL != null, throw NullAttributeException('artworkURL')),
        assert(duration != null, throw NullAttributeException('duration')),
        assert(genre != null, throw NullAttributeException('genre')),
        assert(songURL != null, throw NullAttributeException('songURL')),
        assert(backgroundColor != null,
            throw NullAttributeException('backgroundColor')),
        assert(reference != null, throw NullAttributeException('reference'));

  final String title;

  final String artist;

  final String album;

  final String artworkURL;

  final String genre;

  final int duration;

  final String songURL;

  final String backgroundColor;

  bool isFavorite;

  final DocumentReference reference;

  Song copyWith({
    String title,
    String artist,
    String album,
    String artworkURL,
    String genre,
    int duration,
    String songURL,
    String backgroundColor,
    bool isFavorite,
    DocumentReference reference,
  }) {
    return Song(
      album: album ?? this.album,
      artist: artist ?? this.artist,
      artworkURL: artworkURL ?? this.artworkURL,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      duration: duration ?? this.duration,
      genre: genre ?? this.genre,
      reference: reference ?? this.reference,
      songURL: songURL ?? this.songURL,
      title: title ?? this.title,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
