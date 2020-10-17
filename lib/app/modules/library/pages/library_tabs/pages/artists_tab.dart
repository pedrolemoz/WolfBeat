import 'package:WolfBeat/app/modules/playlist/pages/category_playlist_page.dart';
import 'package:WolfBeat/app/modules/playlist/pages/custom_playlist_page.dart';
import 'package:WolfBeat/core/helpers/media_helper.dart';
import 'package:WolfBeat/core/models/playlist/playlist.dart';
import 'package:WolfBeat/core/view_model/song/songs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../core/helpers/assets_helper.dart';
import '../../../../../../core/view_model/player/player_view_model.dart';

class ArtistsTab extends StatelessWidget {
  final _artists = GetIt.I.get<SongsViewModel>().artists;
  final _playerViewModel = GetIt.I.get<PlayerViewModel>();
  final _mediaHelper = MediaHelper();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _artists.length,
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
            _playerViewModel.playingFrom = _artists.elementAt(index).artistName;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPlaylistPage(
                  playlist: Playlist(
                    playlistName: _artists.elementAt(index).artistName,
                    songs: _mediaHelper.getSongsFromArtist(
                        artistName: _artists.elementAt(index).artistName),
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
                  image: _artists.elementAt(index).artworkURL,
                ),
              ),
              Text(
                _artists.elementAt(index).artistName,
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
