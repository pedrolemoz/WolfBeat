// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerViewModel on _PlayerViewModelBase, Store {
  final _$playerQueueAtom = Atom(name: '_PlayerViewModelBase.playerQueue');

  @override
  ObservableList<Song> get playerQueue {
    _$playerQueueAtom.reportRead();
    return super.playerQueue;
  }

  @override
  set playerQueue(ObservableList<Song> value) {
    _$playerQueueAtom.reportWrite(value, super.playerQueue, () {
      super.playerQueue = value;
    });
  }

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

  final _$playingFromAtom = Atom(name: '_PlayerViewModelBase.playingFrom');

  @override
  String get playingFrom {
    _$playingFromAtom.reportRead();
    return super.playingFrom;
  }

  @override
  set playingFrom(String value) {
    _$playingFromAtom.reportWrite(value, super.playingFrom, () {
      super.playingFrom = value;
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

  final _$currentPositionAtom =
      Atom(name: '_PlayerViewModelBase.currentPosition');

  @override
  Duration get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Duration value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$totalDurationAtom = Atom(name: '_PlayerViewModelBase.totalDuration');

  @override
  Duration get totalDuration {
    _$totalDurationAtom.reportRead();
    return super.totalDuration;
  }

  @override
  set totalDuration(Duration value) {
    _$totalDurationAtom.reportWrite(value, super.totalDuration, () {
      super.totalDuration = value;
    });
  }

  final _$isFavoriteAtom = Atom(name: '_PlayerViewModelBase.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
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

  final _$seekAsyncAction = AsyncAction('_PlayerViewModelBase.seek');

  @override
  Future<void> seek(Duration position) {
    return _$seekAsyncAction.run(() => super.seek(position));
  }

  final _$favoriteSongAsyncAction =
      AsyncAction('_PlayerViewModelBase.favoriteSong');

  @override
  Future<void> favoriteSong() {
    return _$favoriteSongAsyncAction.run(() => super.favoriteSong());
  }

  final _$checkFavoritedAsyncAction =
      AsyncAction('_PlayerViewModelBase.checkFavorited');

  @override
  Future<void> checkFavorited() {
    return _$checkFavoritedAsyncAction.run(() => super.checkFavorited());
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
  void skipToNextSong() {
    final _$actionInfo = _$_PlayerViewModelBaseActionController.startAction(
        name: '_PlayerViewModelBase.skipToNextSong');
    try {
      return super.skipToNextSong();
    } finally {
      _$_PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void skipToPreviousSong() {
    final _$actionInfo = _$_PlayerViewModelBaseActionController.startAction(
        name: '_PlayerViewModelBase.skipToPreviousSong');
    try {
      return super.skipToPreviousSong();
    } finally {
      _$_PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playerQueue: ${playerQueue},
currentSong: ${currentSong},
playingFrom: ${playingFrom},
isPlaying: ${isPlaying},
currentPosition: ${currentPosition},
totalDuration: ${totalDuration},
isFavorite: ${isFavorite}
    ''';
  }
}
