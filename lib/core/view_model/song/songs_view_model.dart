import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../models/song/song.dart';

part 'songs_view_model.g.dart';

/// [SongsViewModel] receives the song information from Firebase.
/// Used in [PlaylistPage], [FavoriteSongsPage].
class SongsViewModel = _SongsViewModelBase with _$SongsViewModel;

/// This is a [Store] for [SongsViewModel]
abstract class _SongsViewModelBase with Store {
  _SongsViewModelBase() {
    fetchSongs();
  }

  @observable
  List<Song> songs = [];

  @action
  void addSong(Song song) {
    songs.add(song);
  }

  @action
  void fetchSongs() {
    var database = Firestore.instance;

    database.collection('songs').getDocuments().then(
      (snapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        snapshot.documents.forEach(
          (songFromFirestore) {
            final song = Song(
              title: songFromFirestore.data['title'],
              songURL: songFromFirestore.data['songURL'],
              album: songFromFirestore.data['album'],
              artist: songFromFirestore.data['artist'],
              artworkURL: songFromFirestore.data['artworkURL'],
              duration: songFromFirestore.data['duration'],
              genre: songFromFirestore.data['genre'],
              backgroundColor: songFromFirestore.data['backgroundColor'],
              reference: songFromFirestore.reference.path,
            );
            addSong(song);

            print(song.reference);
          },
        );
      },
    );
  }
}
