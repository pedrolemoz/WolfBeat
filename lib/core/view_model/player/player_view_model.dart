import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_media_notification/flutter_media_notification.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../helpers/firebase_helper.dart';
import '../../models/playlist/playlist.dart';
import '../../models/song/song.dart';
import '../user/user_view_model.dart';

part 'player_view_model.g.dart';

/// [PlayerViewModel] controls the music player.
/// Used in [MusicTile], [PlayerPage].
class PlayerViewModel = _PlayerViewModelBase with _$PlayerViewModel;

/// This is a [Store] for [PlayerViewModel]
abstract class _PlayerViewModelBase with Store {
  Firestore _database;
  FirebaseAuth _auth;
  FirebaseUser _user;

  final _userViewModel = GetIt.I.get<UserViewModel>();

  _PlayerViewModelBase() {
    _database = Firestore.instance;
    _auth = FirebaseAuth.instance;
    getCurrentUser();
  }

  Future<void> getCurrentUser() async => _user = await _auth.currentUser();

  @observable
  var playerQueue = <Song>[].asObservable();

  @observable
  var currentIndex = 0;

  @observable
  var isShuffled = false;

  @observable
  String playingFrom;

  @observable
  var isPlaying = false;

  @observable
  Duration currentPosition;

  @observable
  Duration totalDuration;

  @observable
  var isFavorite = false;

  final _audioPlayer = AudioPlayer();

  // ignore: use_setters_to_change_properties

  @action
  Future<void> play() async {
    try {
      var _result =
          await _audioPlayer.play(playerQueue.elementAt(currentIndex).songURL);

      if (_result == 1) {
        debugPrint('Playing status: Playing');
        isPlaying = true;

        if (_userViewModel.recentlyPlayedSongs.length <= 10) {
          await _userViewModel.addSongToRecentlyPlayed(
              song: playerQueue.elementAt(currentIndex));
        } else {
          await _userViewModel.removeSongFromRecentlyPlayed(
            song: playerQueue.elementAt(
              _userViewModel.recentlyPlayedSongs
                  .indexOf(_userViewModel.recentlyPlayedSongs.last),
            ),
          );

          await _userViewModel.addSongToRecentlyPlayed(
              song: playerQueue.elementAt(currentIndex));
        }

        await _audioPlayer.onDurationChanged.listen((newDuration) {
          totalDuration = newDuration;
        });

        await _audioPlayer.onAudioPositionChanged.listen((newPosition) {
          currentPosition = newPosition;
        });

        await MediaNotification.showNotification(
          title: playerQueue.elementAt(currentIndex).title,
          author: playerQueue.elementAt(currentIndex).artist,
          isPlaying: true,
        );
      }
    } on RangeError {
      rethrow;
    }
  }

  @action
  void playSongFromPlaylist({Playlist playlist, Song song}) {
    // if (isShuffled) {
    // playlist.songs.sort((a, b) => a.title.compareTo(b.title));
    // playerQueue.sort((a, b) => a.title.compareTo(b.title));
    // isShuffled = false;

    currentIndex = playlist.songs.indexOf(song);
    playerQueue = playlist.songs.asObservable();
    playingFrom = playlist.playlistName;

    play();
  }

  @action
  Future<void> pause() async {
    var _result = await _audioPlayer.pause();
    if (_result == 1) {
      debugPrint('Playing status: Paused');
      isPlaying = false;
    }
  }

  @action
  void playRandomlyFromPlaylist(Playlist playlist) {
    _checkPlayerStatus();

    playlist.songs.shuffle();
    playingFrom = playlist.playlistName;

    playerQueue = playlist.songs.asObservable();

    play();
  }

  @action
  void shuffleQueue() {
    isShuffled = true;

    var currentSong = playerQueue.elementAt(currentIndex);
    var queue = playerQueue;

    queue.remove(currentSong);
    queue.shuffle();
    queue.insert(0, currentSong);

    playerQueue = queue;
  }

  @computed
  bool get canSkipFoward =>
      !(playerQueue.elementAt(currentIndex) == playerQueue.last);

  @computed
  bool get canSkipPrevious =>
      !(playerQueue.elementAt(currentIndex) == playerQueue.first);

  @action
  Future<void> stop() async {
    var _result = await _audioPlayer.stop();
    if (_result == 1) {
      debugPrint('Playing status: Stopped');
      isPlaying = false;
    }
  }

  @action
  Future<void> seek(Duration position) async {
    var _result = await _audioPlayer.seek(position);
    print(_result);
  }

  @action
  void skipToNextSong() {
    checkFavorited();
    _checkPlayerStatus();
    currentIndex++;
    play();
  }

  @action
  void skipToPreviousSong() {
    checkFavorited();
    _checkPlayerStatus();
    currentIndex--;
    play();
  }

  @action
  void _checkPlayerStatus() {
    if (isPlaying) {
      stop();
    }
  }

  /// [_isFavorited] will check if the song is already favorited. If it's the
  /// case, the song reference will be removed from `favoriteSongs` array in
  /// Firestore. Otherwise, the [favoriteSong] method will add the song
  /// reference to `favoriteSongs` array in Firestore.
  @action
  Future<void> favoriteSong() async {
    var _isFavorited = false;

    var _userData = await _database
        .collection(FirebaseHelper.usersCollection)
        .document(_user.uid)
        .get();

    var _favoriteSongs =
        _userData.data[FirebaseHelper.favoriteSongsAttribute] as List;

    for (DocumentReference song in _favoriteSongs) {
      if (song.path == playerQueue.elementAt(currentIndex).reference.path) {
        _isFavorited = true;
        debugPrint('The song is already marked as favorited');
      }
    }

    if (_isFavorited) {
      _favoriteSongs.remove(_database
          .document(playerQueue.elementAt(currentIndex).reference.path));

      await _database
          .collection(FirebaseHelper.usersCollection)
          .document(_user.uid)
          .updateData({FirebaseHelper.favoriteSongsAttribute: _favoriteSongs});

      _userViewModel.favoriteSongs.remove(playerQueue.elementAt(currentIndex));

      isFavorite = false;

      debugPrint('Song removed from favorites');
    } else {
      _favoriteSongs.add(_database
          .document(playerQueue.elementAt(currentIndex).reference.path));

      await _database
          .collection(FirebaseHelper.usersCollection)
          .document(_user.uid)
          .updateData({FirebaseHelper.favoriteSongsAttribute: _favoriteSongs});

      _userViewModel.favoriteSongs.add(playerQueue.elementAt(currentIndex));

      isFavorite = true;

      debugPrint('Song added from favorites');
    }
  }

  @action
  Future<void> checkFavorited() async {
    var _isFavorited = false;
    var _userData = await _database
        .collection(FirebaseHelper.usersCollection)
        .document(_user.uid)
        .get();
    var _favoriteSongs =
        _userData.data[FirebaseHelper.favoriteSongsAttribute] as List;

    for (DocumentReference song in _favoriteSongs) {
      if (song.path == playerQueue.elementAt(currentIndex).reference.path) {
        _isFavorited = true;
        debugPrint('The song is marked as favorited');
      }
    }

    isFavorite = _isFavorited;
  }
}
