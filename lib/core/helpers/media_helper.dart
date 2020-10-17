import 'package:WolfBeat/app/modules/ui_components/music_tile.dart';
import 'package:WolfBeat/core/models/album/album.dart';
import 'package:WolfBeat/core/models/song/song.dart';
import 'package:WolfBeat/core/view_model/song/songs_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class MediaHelper {
  final _songsViewModel = GetIt.I.get<SongsViewModel>();

  List<Song> getSongsFromAlbum({@required String albumName}) =>
      _songsViewModel.songs.where((song) => song.album == albumName).toList();

  List<Song> getSongsFromArtist({@required String artistName}) =>
      _songsViewModel.songs.where((song) => song.artist == artistName).toList();
}
