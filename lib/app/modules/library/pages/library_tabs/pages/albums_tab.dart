import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../core/helpers/assets_helper.dart';
import '../../../../../../core/helpers/media_helper.dart';
import '../../../../../../core/models/playlist/playlist.dart';
import '../../../../../../core/view_model/player/player_view_model.dart';
import '../../../../../../core/view_model/song/songs_view_model.dart';
import '../../../../playlist/pages/category_playlist_page.dart';

class AlbumsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _albums = GetIt.I.get<SongsViewModel>().albums;
    final _playerViewModel = GetIt.I.get<PlayerViewModel>();
    final _mediaHelper = MediaHelper();

    return GridView.builder(
      itemCount: _albums.length,
      shrinkWrap: true,
      padding: EdgeInsets.all(15.0),
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _playerViewModel.playingFrom = _albums.elementAt(index).albumName;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPlaylistPage(
                  playlist: Playlist(
                    playlistName: _albums.elementAt(index).albumName,
                    songs: _mediaHelper.getSongsFromAlbum(
                        albumName: _albums.elementAt(index).albumName),
                  ),
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage.assetNetwork(
                  placeholder: AssetsHelper.artworkFallback,
                  image: _albums.elementAt(index).artworkURL,
                ),
              ),
              Text(
                _albums.elementAt(index).albumName,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        );
      },
    );
  }
}
