import '../../../core/view_model/user/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../core/view_model/song/songs_view_model.dart';
import '../favorite_songs/pages/favorite_songs_page.dart';

/// [FavoriteSonsTile] redirects the user to [FavoriteSongsPage].
/// It's a Container with a disc icon inside.
/// Used in [PlaylistsTab].
class FavoriteSongsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userViewModel = GetIt.I.get<UserViewModel>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, FavoriteSongsPage.id);
        },
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(13.0),
              child: Icon(
                FlutterIcons.disc_mco,
                color: Colors.white,
              ),
            ),
          ),
          title: Observer(builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Suas músicas curtidas',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  '${_userViewModel.favoriteSongs.length} ${_userViewModel.favoriteSongs.length > 1 ? "músicas" : "música"}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
