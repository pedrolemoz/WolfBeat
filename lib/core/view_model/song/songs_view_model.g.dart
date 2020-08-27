// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SongsViewModel on _SongsViewModelBase, Store {
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
songs: ${songs}
    ''';
  }
}
