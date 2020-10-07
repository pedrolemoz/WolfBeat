import 'package:WolfBeat/app/modules/ui_components/music_tile.dart';
import 'package:WolfBeat/core/models/album/album.dart';
import 'package:WolfBeat/core/view_model/song/songs_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class MediaHelper {
  final _songsViewModel = GetIt.I.get<SongsViewModel>();

  List<MusicTile> getSongsFromAlbum({@required String albumName}) =>
      _songsViewModel.songs
          .where((song) => song.album == albumName)
          .map((song) => MusicTile(song: song))
          .toList();

  List<MusicTile> getSongsFromArtist({@required String artistName}) =>
      _songsViewModel.songs
          .where((song) => song.artist == artistName)
          .map((song) => MusicTile(song: song))
          .toList();
}
