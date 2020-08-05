import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../models/song.dart';

/// [SongsController] is a widget that receives the song information from Firebase.
/// It's a set of methods.
/// Used in [PlaylistPage], [FavoriteSongsPage].
class SongsController extends ChangeNotifier {
  SongsController() {
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
