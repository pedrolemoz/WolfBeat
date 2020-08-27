// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerViewModel on _PlayerViewModelBase, Store {
  final _$currentSongAtom = Atom(name: '_PlayerViewModelBase.currentSong');

  @override
  Song get currentSong {
    _$currentSongAtom.reportRead();
    return super.currentSong;
  }

  @override
  set currentSong(Song value) {
    _$currentSongAtom.reportWrite(value, super.currentSong, () {
      super.currentSong = value;
    });
  }

  final _$isPlayingAtom = Atom(name: '_PlayerViewModelBase.isPlaying');

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  final _$currentTimeAtom = Atom(name: '_PlayerViewModelBase.currentTime');

  @override
  int get currentTime {
    _$currentTimeAtom.reportRead();
    return super.currentTime;
  }

  @override
  set currentTime(int value) {
    _$currentTimeAtom.reportWrite(value, super.currentTime, () {
      super.currentTime = value;
    });
  }

  final _$playAsyncAction = AsyncAction('_PlayerViewModelBase.play');

  @override
  Future<void> play() {
    return _$playAsyncAction.run(() => super.play());
  }

  final _$pauseAsyncAction = AsyncAction('_PlayerViewModelBase.pause');

  @override
  Future<void> pause() {
    return _$pauseAsyncAction.run(() => super.pause());
  }

  final _$stopAsyncAction = AsyncAction('_PlayerViewModelBase.stop');

  @override
  Future<void> stop() {
    return _$stopAsyncAction.run(() => super.stop());
  }

  final _$favoriteSongsAsyncAction =
      AsyncAction('_PlayerViewModelBase.favoriteSongs');

  @override
  Future<void> favoriteSongs() {
    return _$favoriteSongsAsyncAction.run(() => super.favoriteSongs());
  }

  final _$_PlayerViewModelBaseActionController =
      ActionController(name: '_PlayerViewModelBase');

  @override
  void updateCurrentSong(Song newSong) {
    final _$actionInfo = _$_PlayerViewModelBaseActionController.startAction(
        name: '_PlayerViewModelBase.updateCurrentSong');
    try {
      return super.updateCurrentSong(newSong);
    } finally {
      _$_PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentSong: ${currentSong},
isPlaying: ${isPlaying},
currentTime: ${currentTime}
    ''';
  }
}
