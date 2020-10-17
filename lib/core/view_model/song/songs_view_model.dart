import 'package:WolfBeat/core/models/album/album.dart';
import 'package:WolfBeat/core/models/artist/artist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../helpers/firebase_helper.dart';
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
  List<Album> albums = [];

  @observable
  List<Artist> artists = [];

  @observable
  List<Song> songs = [];

  @action
  void addSong(Song song) {
    songs.add(song);

    if (!albums.map((song) => song.albumName).contains(song.album)) {
      albums.add(Album(
        albumName: song.album,
        artist: song.artist,
        artworkURL: song.artworkURL,
      ));
    }

    if (!artists.map((song) => song.artistName).contains(song.artist)) {
      artists.add(Artist(
        artistName: song.artist,
        artworkURL: song.artworkURL,
      ));
    }
  }

  @action
  void fetchSongs() {
    var database = Firestore.instance;

    database.collection(FirebaseHelper.songsCollection).getDocuments().then(
      (snapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        snapshot.documents.forEach(
          (songFromFirestore) {
            final song = Song(
              title: songFromFirestore.data[FirebaseHelper.titleAttribute],
              songURL: songFromFirestore.data[FirebaseHelper.songURLAttribute],
              album: songFromFirestore.data[FirebaseHelper.albumAttribute],
              artist: songFromFirestore.data[FirebaseHelper.artistAttribute],
              artworkURL:
                  songFromFirestore.data[FirebaseHelper.artworkURLAttribute],
              duration:
                  songFromFirestore.data[FirebaseHelper.durationAttribute],
              genre: songFromFirestore.data[FirebaseHelper.genreAttribute],
              backgroundColor: songFromFirestore
                  .data[FirebaseHelper.backgroundColorAttribute],
              reference: songFromFirestore.reference,
            );
            addSong(song);

            print(song.reference);
          },
        );
      },
    );
  }
}
