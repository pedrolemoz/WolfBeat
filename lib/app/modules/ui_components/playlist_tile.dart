import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../core/helpers/assets_helper.dart';
import '../../../core/models/playlist/playlist.dart';
import '../../../core/view_model/user/user_view_model.dart';
import '../playlist/pages/custom_playlist_page.dart';

/// [PlaylistTile] is a widget that redirects the user to ***.
/// It's a Container with the first 4 music cover of the playlist inside.
/// Used in [PlaylistsTab].

class PlaylistTile extends StatelessWidget {
  PlaylistTile({this.playlist});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    final _userViewModel = GetIt.I.get<UserViewModel>();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomPlaylistPage(
              playlistIndex: _userViewModel.playlists.indexOf(playlist),
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: 50.0,
              child: GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                ),
                itemBuilder: (context, index) {
                  try {
                    return FadeInImage.assetNetwork(
                      placeholder: AssetsHelper.artworkFallback,
                      image: playlist.songs?.elementAt(index)?.artworkURL,
                    );
                  } on RangeError catch (_) {
                    return Image.asset(AssetsHelper.artworkFallback);
                  }
                },
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${playlist.playlistName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                '${playlist.songs.length} músicas',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
