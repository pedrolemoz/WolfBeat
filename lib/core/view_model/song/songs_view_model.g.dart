// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SongsViewModel on _SongsViewModelBase, Store {
  final _$albumsAtom = Atom(name: '_SongsViewModelBase.albums');

  @override
  List<Album> get albums {
    _$albumsAtom.reportRead();
    return super.albums;
  }

  @override
  set albums(List<Album> value) {
    _$albumsAtom.reportWrite(value, super.albums, () {
      super.albums = value;
    });
  }

  final _$artistsAtom = Atom(name: '_SongsViewModelBase.artists');

  @override
  List<Artist> get artists {
    _$artistsAtom.reportRead();
    return super.artists;
  }

  @override
  set artists(List<Artist> value) {
    _$artistsAtom.reportWrite(value, super.artists, () {
      super.artists = value;
    });
  }

  final _$songsAtom = Atom(name: '_SongsViewModelBase.songs');

  @override
  List<Song> get songs {
    _$songsAtom.reportRead();
    return super.songs;
  }

  @override
  set songs(List<Song> value) {
    _$songsAtom.reportWrite(value, super.songs, () {
      super.songs = value;
    });
  }

  final _$recentlyPlayedAtom = Atom(name: '_SongsViewModelBase.recentlyPlayed');

  @override
  ObservableList<Song> get recentlyPlayed {
    _$recentlyPlayedAtom.reportRead();
    return super.recentlyPlayed;
  }

  @override
  set recentlyPlayed(ObservableList<Song> value) {
    _$recentlyPlayedAtom.reportWrite(value, super.recentlyPlayed, () {
      super.recentlyPlayed = value;
    });
  }

  final _$recommendedSongsAtom =
      Atom(name: '_SongsViewModelBase.recommendedSongs');

  @override
  ObservableList<Song> get recommendedSongs {
    _$recommendedSongsAtom.reportRead();
    return super.recommendedSongs;
  }

  @override
  set recommendedSongs(ObservableList<Song> value) {
    _$recommendedSongsAtom.reportWrite(value, super.recommendedSongs, () {
      super.recommendedSongs = value;
    });
  }

  final _$_recoverUserPlaylistsAsyncAction =
      AsyncAction('_SongsViewModelBase._recoverUserPlaylists');

  @override
  Future<void> _recoverUserPlaylists(DocumentSnapshot snapshot) {
    return _$_recoverUserPlaylistsAsyncAction
        .run(() => super._recoverUserPlaylists(snapshot));
  }

  final _$_SongsViewModelBaseActionController =
      ActionController(name: '_SongsViewModelBase');

  @override
  void addSong(Song song) {
    final _$actionInfo = _$_SongsViewModelBaseActionController.startAction(
        name: '_SongsViewModelBase.addSong');
    try {
      return super.addSong(song);
    } finally {
      _$_SongsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchSongs() {
    final _$actionInfo = _$_SongsViewModelBaseActionController.startAction(
        name: '_SongsViewModelBase.fetchSongs');
    try {
      return super.fetchSongs();
    } finally {
      _$_SongsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
albums: ${albums},
artists: ${artists},
songs: ${songs},
recentlyPlayed: ${recentlyPlayed},
recommendedSongs: ${recommendedSongs}
    ''';
  }
}
