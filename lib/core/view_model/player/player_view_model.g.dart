// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerViewModel on _PlayerViewModelBase, Store {
  Computed<bool> _$canSkipFowardComputed;

  @override
  bool get canSkipFoward =>
      (_$canSkipFowardComputed ??= Computed<bool>(() => super.canSkipFoward,
              name: '_PlayerViewModelBase.canSkipFoward'))
          .value;
  Computed<bool> _$canSkipPreviousComputed;

  @override
  bool get canSkipPrevious =>
      (_$canSkipPreviousComputed ??= Computed<bool>(() => super.canSkipPrevious,
              name: '_PlayerViewModelBase.canSkipPrevious'))
          .value;

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

  final _$currentIndexAtom = Atom(name: '_PlayerViewModelBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$isShuffledAtom = Atom(name: '_PlayerViewModelBase.isShuffled');

  @override
  bool get isShuffled {
    _$isShuffledAtom.reportRead();
    return super.isShuffled;
  }

  @override
  set isShuffled(bool value) {
    _$isShuffledAtom.reportWrite(value, super.isShuffled, () {
      super.isShuffled = value;
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
  Future<void> playSongFromPlaylist({Playlist playlist, Song song}) {
    final _$actionInfo = _$_PlayerViewModelBaseActionController.startAction(
        name: '_PlayerViewModelBase.playSongFromPlaylist');
    try {
      return super.playSongFromPlaylist(playlist: playlist, song: song);
    } finally {
      _$_PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void playRandomlyFromPlaylist(Playlist playlist) {
    final _$actionInfo = _$_PlayerViewModelBaseActionController.startAction(
        name: '_PlayerViewModelBase.playRandomlyFromPlaylist');
    try {
      return super.playRandomlyFromPlaylist(playlist);
    } finally {
      _$_PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void shuffleQueue() {
    final _$actionInfo = _$_PlayerViewModelBaseActionController.startAction(
        name: '_PlayerViewModelBase.shuffleQueue');
    try {
      return super.shuffleQueue();
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
  void _checkPlayerStatus() {
    final _$actionInfo = _$_PlayerViewModelBaseActionController.startAction(
        name: '_PlayerViewModelBase._checkPlayerStatus');
    try {
      return super._checkPlayerStatus();
    } finally {
      _$_PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playerQueue: ${playerQueue},
currentIndex: ${currentIndex},
isShuffled: ${isShuffled},
playingFrom: ${playingFrom},
isPlaying: ${isPlaying},
currentPosition: ${currentPosition},
totalDuration: ${totalDuration},
isFavorite: ${isFavorite},
canSkipFoward: ${canSkipFoward},
canSkipPrevious: ${canSkipPrevious}
    ''';
  }
}
