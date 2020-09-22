import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../../models/song/song.dart';

part 'player_view_model.g.dart';

/// [PlayerViewModel] controls the music player.
/// Used in [MusicTile], [PlayerPage].
class PlayerViewModel = _PlayerViewModelBase with _$PlayerViewModel;

/// This is a [Store] for [PlayerViewModel]
abstract class _PlayerViewModelBase with Store {
  Firestore _database;
  FirebaseAuth _auth;
  FirebaseUser _user;

  _PlayerViewModelBase() {
    _database = Firestore.instance;
    _auth = FirebaseAuth.instance;
    getCurrentUser();
  }

  Future<void> getCurrentUser() async => _user = await _auth.currentUser();

  @observable
  var playerQueue = <Song>[].asObservable();

  @observable
  Song currentSong;

  @observable
  var isPlaying = false;

  @observable
  int currentTime;

  @observable
  var isFavorite = false;

  final _audioPlayer = AudioPlayer();

  // ignore: use_setters_to_change_properties
  @action
  void updateCurrentSong(Song newSong) => currentSong = newSong;

  @action
  Future<void> play() async {
    var _result = await _audioPlayer.play(currentSong.songURL);
    if (_result == 1) {
      debugPrint('Playing status: Playing');
      isPlaying = true;
    }
  }

  @action
  Future<void> pause() async {
    debugPrint(currentSong.songURL);
    var _result = await _audioPlayer.pause();
    if (_result == 1) {
      debugPrint('Playing status: Paused');
      isPlaying = false;
    }
  }

  @action
  Future<void> stop() async {
    debugPrint(currentSong.songURL);
    var _result = await _audioPlayer.stop();
    if (_result == 1) {
      debugPrint('Playing status: Stopped');
      isPlaying = false;
    }
  }

  @action
  void skipToNextSong() {}

  @action
  void skipToPreviousSong() {}

  /// [_isFavorited] will check if the song is already favorited. If it's the
  /// case, the song reference will be removed from `favoriteSongs` array in
  /// Firestore. Otherwise, the [favoriteSong] method will add the song
  /// reference to `favoriteSongs` array in Firestore.
  @action
  Future<void> favoriteSong() async {
    var _isFavorited = false;
    var _userData =
        await _database.collection('users').document(_user.uid).get();
    var _favoriteSongs = _userData.data['favoriteSongs'] as List;

    for (DocumentReference song in _favoriteSongs) {
      if (song.path == currentSong.reference) {
        _isFavorited = true;
        debugPrint('The song is already marked as favorited');
      }
    }

    if (_isFavorited) {
      _favoriteSongs.remove(_database.document(currentSong.reference));
      await _database
          .collection('users')
          .document(_user.uid)
          .updateData({'favoriteSongs': _favoriteSongs});
      isFavorite = false;
      debugPrint('Song removed from favorites');
    } else {
      _favoriteSongs.add(_database.document(currentSong.reference));
      await _database
          .collection('users')
          .document(_user.uid)
          .updateData({'favoriteSongs': _favoriteSongs});
      isFavorite = true;
      debugPrint('Song added from favorites');
    }
  }

  @action
  Future<void> checkFavorited() async {
    var _isFavorited = false;
    var _userData =
        await _database.collection('users').document(_user.uid).get();
    var _favoriteSongs = _userData.data['favoriteSongs'] as List;

    for (DocumentReference song in _favoriteSongs) {
      if (song.path == currentSong.reference) {
        _isFavorited = true;
        debugPrint('The song is marked as favorited');
      }
    }

    isFavorite = _isFavorited;
  }
}
