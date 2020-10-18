import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../helpers/firebase_helper.dart';
import '../../models/album/album.dart';
import '../../models/artist/artist.dart';
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
  var albums = <Album>[];

  @observable
  var artists = <Artist>[];

  @observable
  var songs = <Song>[];

  @observable
  var recommendedSongs = <Song>[].asObservable();

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

    if (recommendedSongs.length < 10) {
      var shouldRecommend = Random().nextBool();

      if (shouldRecommend) {
        recommendedSongs.add(song);
      }
    }
  }

  @action
  Future<void> _recoverUserPlaylists(DocumentSnapshot snapshot) async {
    var data = snapshot.data;

    var _playlists = data[FirebaseHelper.playlistsAttribute];

    for (var playlist in _playlists) {
      var songs = <Song>[];
      for (DocumentReference songReference
          in playlist[FirebaseHelper.playlistSongsAttribute] as List) {
        final song = await songReference.get();

        songs.add(
          Song(
            title: song.data[FirebaseHelper.titleAttribute],
            songURL: song.data[FirebaseHelper.songURLAttribute],
            album: song.data[FirebaseHelper.albumAttribute],
            artist: song.data[FirebaseHelper.artistAttribute],
            artworkURL: song.data[FirebaseHelper.artworkURLAttribute],
            duration: song.data[FirebaseHelper.durationAttribute],
            genre: song.data[FirebaseHelper.genreAttribute],
            backgroundColor: song.data[FirebaseHelper.backgroundColorAttribute],
            reference: song.reference,
          ),
        );
      }
    }
  }

  @action
  void fetchSongs() {
    var database = Firestore.instance;

    database.collection(FirebaseHelper.songsCollection).getDocuments().then(
      (snapshot) {
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
            // addRecentlyPlayedSong(song: song, database: database);
          },
        );
      },
    );
  }
}
