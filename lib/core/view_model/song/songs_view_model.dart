import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../models/song/song.dart';

/// [SongsViewModel] receives the song information from Firebase.
/// Used in [PlaylistPage], [FavoriteSongsPage].
class SongsViewModel extends ChangeNotifier {
  SongsViewModel() {
    fetchSongs();
  }

  List<Song> songs = [];

  void addSong(Song song) {
    songs.add(song);
    notifyListeners();
  }

  Future<void> fetchSongs() async {
    var database = Firestore.instance;

    database.collection('songs').getDocuments().then((snapshot) {
      snapshot.documents.forEach((songFromFirestore) {
        final song = Song(
          title: songFromFirestore.data['title'],
          songURL: songFromFirestore.data['songURL'],
          album: songFromFirestore.data['album'],
          artist: songFromFirestore.data['artist'],
          artworkURL: songFromFirestore.data['artworkURL'],
          duration: songFromFirestore.data['duration'],
          genre: songFromFirestore.data['genre'],
          backgroundColor: songFromFirestore.data['backgroundColor'],
        );

        addSong(song);
      });
    });
  }
}
