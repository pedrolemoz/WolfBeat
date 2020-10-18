import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get_it/get_it.dart';

import '../../../core/exceptions/null_attribute_exception.dart';
import '../../../core/helpers/assets_helper.dart';
import '../../../core/models/song/song.dart';
import '../../../core/view_model/player/player_view_model.dart';
import '../../../core/view_model/user/user_view_model.dart';

/// [MusicTile] redirects the user to the player in the selected song.
/// It's a GestureDetector with a provider for the [PlayerViewModel].
/// Used in [FavoriteSongsPage].
class MusicTile extends StatelessWidget {
  MusicTile({
    @required this.song,
    this.playlistName,
    this.onTap,
    this.onDelete,
  }) : assert(song != null, throw NullAttributeException('song'));

  final Song song;
  final String playlistName;
  final Function onTap;
  final Function onDelete;
  final playerViewModel = GetIt.I.get<PlayerViewModel>();
  final userViewModel = GetIt.I.get<UserViewModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: GestureDetector(
        onTap: onTap,
        onLongPress: () {
          // TODO: Refazer bottom sheet
          playlistName != null
              ? showBottomSheet(
                  context: context,
                  backgroundColor: Theme.of(context).backgroundColor,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.3,
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
                                'Remover de "$playlistName"',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: ListTile(
                              leading: Icon(
                                FlutterIcons.share_2_fea,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Compartilhar',
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
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : null;
        },
        child: ListTile(
          leading: FadeInImage.assetNetwork(
            placeholder: AssetsHelper.artworkFallback,
            image: song?.artworkURL,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                song?.title ?? 'Música desconhecida',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                song?.artist ?? 'Artista Desconhecido',
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
