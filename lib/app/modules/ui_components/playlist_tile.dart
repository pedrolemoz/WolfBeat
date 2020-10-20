import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get_it/get_it.dart';

import '../../../core/helpers/assets_helper.dart';
import '../../../core/models/playlist/playlist.dart';
import '../../../core/view_model/user/user_view_model.dart';
import '../playlist/pages/custom_playlist_page.dart';

/// [PlaylistTile] is a widget that redirects the user to ***.
/// It's a Container with the first 4 music cover of the playlist inside.
/// Used in [PlaylistsTab].

class PlaylistTile extends StatelessWidget {
  PlaylistTile({this.playlist, this.onDelete});

  final Playlist playlist;
  final Function onDelete;
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
      onLongPress: () {
        showBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).backgroundColor,
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: onDelete,
                    child: ListTile(
                      leading: Icon(
                        FlutterIcons.trash_can_outline_mco,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Excluir ${playlist.playlistName}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.maybePop(context);
                    },
                    child: ListTile(
                      leading: Icon(
                        FlutterIcons.cancel_mco,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        'Fechar',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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
