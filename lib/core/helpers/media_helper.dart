import 'package:WolfBeat/app/modules/ui_components/music_tile.dart';
import 'package:WolfBeat/core/models/album/album.dart';
import 'package:WolfBeat/core/view_model/song/songs_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class MediaHelper {
  final _songsViewModel = GetIt.I.get<SongsViewModel>();
  void getSongsFromAlbum({@required String albumName}) {
    //var album = _songsViewModel.albums.map((album) => album.albumName);

     print(_songsViewModel.songs
        .where((song) => song.album == albumName)
        .map((song) => MusicTile(
              song: song,
            )));
  }

  /*List<MusicTile> getSongsFromArtist() {

  }*/
}
