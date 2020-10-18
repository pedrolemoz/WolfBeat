// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserViewModel on _UserViewModelBase, Store {
  final _$playlistsAtom = Atom(name: '_UserViewModelBase.playlists');

  @override
  ObservableList<Playlist> get playlists {
    _$playlistsAtom.reportRead();
    return super.playlists;
  }

  @override
  set playlists(ObservableList<Playlist> value) {
    _$playlistsAtom.reportWrite(value, super.playlists, () {
      super.playlists = value;
    });
  }

  final _$favoriteSongsAtom = Atom(name: '_UserViewModelBase.favoriteSongs');

  @override
  ObservableList<Song> get favoriteSongs {
    _$favoriteSongsAtom.reportRead();
    return super.favoriteSongs;
  }

  @override
  set favoriteSongs(ObservableList<Song> value) {
    _$favoriteSongsAtom.reportWrite(value, super.favoriteSongs, () {
      super.favoriteSongs = value;
    });
  }

  final _$userIDAtom = Atom(name: '_UserViewModelBase.userID');

  @override
  String get userID {
    _$userIDAtom.reportRead();
    return super.userID;
  }

  @override
  set userID(String value) {
    _$userIDAtom.reportWrite(value, super.userID, () {
      super.userID = value;
    });
  }

  final _$userNameAtom = Atom(name: '_UserViewModelBase.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$userEmailAtom = Atom(name: '_UserViewModelBase.userEmail');

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$imageURIAtom = Atom(name: '_UserViewModelBase.imageURI');

  @override
  String get imageURI {
    _$imageURIAtom.reportRead();
    return super.imageURI;
  }

  @override
  set imageURI(String value) {
    _$imageURIAtom.reportWrite(value, super.imageURI, () {
      super.imageURI = value;
    });
  }

  final _$typeAtom = Atom(name: '_UserViewModelBase.type');

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$recoverUserDataAsyncAction =
      AsyncAction('_UserViewModelBase.recoverUserData');

  @override
  Future<void> recoverUserData() {
    return _$recoverUserDataAsyncAction.run(() => super.recoverUserData());
  }

  final _$signOutUserAsyncAction =
      AsyncAction('_UserViewModelBase.signOutUser');

  @override
  Future<void> signOutUser(BuildContext context) {
    return _$signOutUserAsyncAction.run(() => super.signOutUser(context));
  }

  final _$_recoverUserPlaylistsAsyncAction =
      AsyncAction('_UserViewModelBase._recoverUserPlaylists');

  @override
  Future<void> _recoverUserPlaylists(DocumentSnapshot snapshot) {
    return _$_recoverUserPlaylistsAsyncAction
        .run(() => super._recoverUserPlaylists(snapshot));
  }

  final _$_recoverFavoriteSongsAsyncAction =
      AsyncAction('_UserViewModelBase._recoverFavoriteSongs');

  @override
  Future<void> _recoverFavoriteSongs(DocumentSnapshot snapshot) {
    return _$_recoverFavoriteSongsAsyncAction
        .run(() => super._recoverFavoriteSongs(snapshot));
  }

  final _$_changeSongInPlaylistAsyncAction =
      AsyncAction('_UserViewModelBase._changeSongInPlaylist');

  @override
  Future<void> _changeSongInPlaylist({@required Playlist playlist}) {
    return _$_changeSongInPlaylistAsyncAction
        .run(() => super._changeSongInPlaylist(playlist: playlist));
  }

  final _$createNewPlaylistAsyncAction =
      AsyncAction('_UserViewModelBase.createNewPlaylist');

  @override
  Future<int> createNewPlaylist({@required Playlist newPlaylist}) {
    return _$createNewPlaylistAsyncAction
        .run(() => super.createNewPlaylist(newPlaylist: newPlaylist));
  }

  final _$_UserViewModelBaseActionController =
      ActionController(name: '_UserViewModelBase');

  @override
  void updateImageURI(String newImageURI) {
    final _$actionInfo = _$_UserViewModelBaseActionController.startAction(
        name: '_UserViewModelBase.updateImageURI');
    try {
      return super.updateImageURI(newImageURI);
    } finally {
      _$_UserViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSongToPlaylist({@required Playlist playlist, @required Song song}) {
    final _$actionInfo = _$_UserViewModelBaseActionController.startAction(
        name: '_UserViewModelBase.addSongToPlaylist');
    try {
      return super.addSongToPlaylist(playlist: playlist, song: song);
    } finally {
      _$_UserViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSongFromPlaylist(
      {@required Playlist playlist, @required Song song}) {
    final _$actionInfo = _$_UserViewModelBaseActionController.startAction(
        name: '_UserViewModelBase.removeSongFromPlaylist');
    try {
      return super.removeSongFromPlaylist(playlist: playlist, song: song);
    } finally {
      _$_UserViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playlists: ${playlists},
favoriteSongs: ${favoriteSongs},
userID: ${userID},
userName: ${userName},
userEmail: ${userEmail},
imageURI: ${imageURI},
type: ${type}
    ''';
  }
}
