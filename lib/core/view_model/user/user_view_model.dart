import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

import '../../../app/modules/welcome/pages/welcome_page.dart';
import '../../helpers/firebase_helper.dart';
import '../../models/playlist/playlist.dart';
import '../../models/song/song.dart';

part 'user_view_model.g.dart';

/// [UserViewModel] receives the user information from Firebase.
/// Used in [ProfileSettingsPage], [SettingsPage]
/// and in [loginUserWithEmailAndPassword].
class UserViewModel = _UserViewModelBase with _$UserViewModel;

/// This is a [Store] for [UserViewModel]
abstract class _UserViewModelBase with Store {
  _UserViewModelBase() {
    recoverUserData();
  }

  @observable
  var playlists = <Playlist>[].asObservable();

  @observable
  var favoriteSongs = <Song>[].asObservable();

  @observable
  var recentlyPlayedSongs = <Song>[].asObservable();

  @observable
  String userID;

  @observable
  String userName;

  @observable
  String userEmail;

  @observable
  String imageURI;

  @observable
  String type;

  @action
  Future<void> recoverUserData() async {
    var _auth = FirebaseAuth.instance;
    var _database = Firestore.instance;
    var _user = await _auth.currentUser();

    var _snapshot = await _database
        .collection(FirebaseHelper.usersCollection)
        .document(_user.uid)
        .get();

    var _data = _snapshot.data;

    if (_data.isNotEmpty) {
      await _recoverUserPlaylists(_snapshot);
      await _recoverFavoriteSongs(_snapshot);
      await _recoverRecentlyPlayedSongs(_snapshot);

      userID = _user.uid;
      userName = _data[FirebaseHelper.nameAttribute];
      userEmail = _data[FirebaseHelper.emailAttribute];
      imageURI = _data[FirebaseHelper.imageURIAttribute];
      type = _data[FirebaseHelper.typeAttribute];
    }
  }

  @action
  Future<void> signOutUser(BuildContext context) async {
    var _auth = FirebaseAuth.instance;
    var _googleSignIn = GoogleSignIn();

    await _auth.signOut().then((value) {
      _googleSignIn.signOut().then((_) {
        debugPrint('Logged out');
      });
    });

    await Navigator.pushNamedAndRemoveUntil(
      context,
      WelcomePage.id,
      (route) => false,
    );
  }

  // ignore: use_setters_to_change_properties
  @action
  void updateImageURI(String newImageURI) => imageURI = newImageURI;

  @action
  Future<void> _recoverUserPlaylists(DocumentSnapshot snapshot) async {
    var _data = snapshot.data;

    var _playlists = _data[FirebaseHelper.playlistsAttribute];

    for (var playlist in _playlists) {
      var _songs = <Song>[];

      for (DocumentReference songReference
          in playlist[FirebaseHelper.playlistSongsAttribute] as List) {
        final song = await songReference.get();

        _songs.add(
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

      playlists.add(
        Playlist(
          playlistName: playlist[FirebaseHelper.playlistNameAttribute],
          songs: _songs,
        ),
      );
    }
  }

  @action
  Future<void> addSongToRecentlyPlayed({Song song}) async {
    var _auth = FirebaseAuth.instance;
    var _database = Firestore.instance;
    var _user = await _auth.currentUser();

    var _snapshot = await _database
        .collection(FirebaseHelper.usersCollection)
        .document(_user.uid)
        .get();

    var _data = _snapshot.data;

    var _recentlyPlayed = _data[FirebaseHelper.recentlyPlayed] as List;

    _recentlyPlayed.add(song.reference);

    await _database
        .collection(FirebaseHelper.usersCollection)
        .document(_user.uid)
        .updateData({FirebaseHelper.recentlyPlayed: _recentlyPlayed});

    recentlyPlayedSongs.add(song);
  }

  @action
  Future<void> removeSongFromRecentlyPlayed({Song song}) async {
    var _auth = FirebaseAuth.instance;
    var _database = Firestore.instance;
    var _user = await _auth.currentUser();

    var _snapshot = await _database
        .collection(FirebaseHelper.usersCollection)
        .document(_user.uid)
        .get();

    var _data = _snapshot.data;

    var _recentlyPlayed = _data[FirebaseHelper.recentlyPlayed] as List;

    _recentlyPlayed.remove(song.reference);

    await _database
        .collection(FirebaseHelper.usersCollection)
        .document(_user.uid)
        .updateData({FirebaseHelper.recentlyPlayed: _recentlyPlayed});

    recentlyPlayedSongs.remove(song);
  }

  @action
  Future<void> _recoverRecentlyPlayedSongs(DocumentSnapshot snapshot) async {
    var _data = snapshot.data;

    for (DocumentReference songReference
        in _data[FirebaseHelper.recentlyPlayed] as List) {
      final song = await songReference.get();

      recentlyPlayedSongs.insert(
        0,
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

  @action
  Future<void> _recoverFavoriteSongs(DocumentSnapshot snapshot) async {
    var _data = snapshot.data;

    for (DocumentReference songReference
        in _data[FirebaseHelper.favoriteSongsAttribute] as List) {
      final song = await songReference.get();

      favoriteSongs.add(
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

  @action
  void addSongToPlaylist({
    @required Playlist playlist,
    @required Song song,
  }) {
    playlist.songs.add(song);
    _changeSongInPlaylist(playlist: playlist);
  }

  @action
  void removeSongFromPlaylist({
    @required Playlist playlist,
    @required Song song,
  }) {
    playlist.songs.remove(song);
    _changeSongInPlaylist(playlist: playlist);
  }

  @action
  Future<void> removeUserPlaylist({@required Playlist playlist}) async {
    var _auth = FirebaseAuth.instance;
    var _database = Firestore.instance;
    var _user = await _auth.currentUser();

    var snapshot = await _database
        .collection(FirebaseHelper.usersCollection)
        .document(_user.uid)
        .get();

    var _data = snapshot.data;

    List<Map<String,dynamic>> _userPlaylists = _data[FirebaseHelper.playlistsAttribute];
    // Map<String, dynamic> _currentPlaylist = _userPlaylists.singleWhere(
    //     (userPlaylist) =>
    //         userPlaylist[FirebaseHelper.playlistNameAttribute] ==
    //         playlist.playlistName);

    
    print(_userPlaylists == _data[FirebaseHelper.playlistsAttribute]);
    // await _database
    //     .collection(FirebaseHelper.usersCollection)
    //     .document(_user.uid)
    //     .updateData({FirebaseHelper.playlistsAttribute: _userPlaylists});

    //playlists.remove(playlist);
  }

  @action
  Future<void> _changeSongInPlaylist({
    @required Playlist playlist,
  }) async {
    var _auth = FirebaseAuth.instance;
    var _database = Firestore.instance;
    var _user = await _auth.currentUser();

    var _snapshot = await _database
        .collection(FirebaseHelper.usersCollection)
        .document(_user.uid)
        .get();

    var _data = _snapshot.data;

    List _userPlaylists = _data[FirebaseHelper.playlistsAttribute];

    Map<String, dynamic> _currentPlaylist = _userPlaylists.singleWhere(
        (userPlaylist) =>
            userPlaylist[FirebaseHelper.playlistNameAttribute] ==
            playlist.playlistName);

    var _index = _userPlaylists.indexOf(_currentPlaylist);

    var songs = playlist.songs.map((song) => song.reference).toList();

    _currentPlaylist[FirebaseHelper.playlistSongsAttribute] = songs;

    _userPlaylists[_index] = _currentPlaylist;

    await _database
        .collection(FirebaseHelper.usersCollection)
        .document(_user.uid)
        .updateData({FirebaseHelper.playlistsAttribute: _userPlaylists});

    playlists[playlists.indexOf(playlist)] =
        playlist.copyWith(songs: playlist.songs);
  }

  @action
  Future<int> createNewPlaylist({@required Playlist newPlaylist}) async {
    var _auth = FirebaseAuth.instance;
    var _database = Firestore.instance;
    var _user = await _auth.currentUser();

    var snapshot = await _database
        .collection(FirebaseHelper.usersCollection)
        .document(_user.uid)
        .get();

    var _data = snapshot.data;

    List<dynamic> _userPlaylists = _data[FirebaseHelper.playlistsAttribute];

    _userPlaylists.add(
      <String, dynamic>{
        FirebaseHelper.playlistNameAttribute: newPlaylist.playlistName,
        FirebaseHelper.playlistSongsAttribute: newPlaylist.songs,
      },
    );

    await _database
        .collection(FirebaseHelper.usersCollection)
        .document(_user.uid)
        .updateData({FirebaseHelper.playlistsAttribute: _userPlaylists});

    playlists.add(newPlaylist);

    return playlists.indexOf(newPlaylist);
  }
}
