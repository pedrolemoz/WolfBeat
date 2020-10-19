import 'package:WolfBeat/app/modules/player/pages/player_page.dart';
import 'package:WolfBeat/core/models/playlist/playlist.dart';
import 'package:WolfBeat/core/view_model/player/player_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/helpers/assets_helper.dart';
import '../../../../core/view_model/song/songs_view_model.dart';
import '../../../../core/view_model/user/user_view_model.dart';
import '../../settings/pages/settings_page.dart';
import '../../ui_components/favorite_songs_card.dart';
import '../../ui_components/playlist_card.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';

  @override
  Widget build(BuildContext context) {
    final _userViewModel = GetIt.I.get<UserViewModel>();
    final _songsViewModel = GetIt.I.get<SongsViewModel>();
    final _playerViewModel = GetIt.I.get<PlayerViewModel>();

    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Início',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, SettingsPage.id),
                    splashColor: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(50.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Center(
                        child: Icon(
                          FlutterIcons.settings_sli,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: GridView.builder(
                itemCount: _userViewModel.playlists.length >= 4
                    ? 4
                    : _userViewModel.playlists.length + 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 3.0,
                ),
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return FavoriteSongsCard();
                    default:
                      return PlaylistCard(
                        playlist: _userViewModel.playlists.elementAt(index - 1),
                      );
                  }
                },
              ),
            ),
            Observer(
              builder: (_) {
                if (_userViewModel.recentlyPlayedSongs.isEmpty) {
                  return SizedBox();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Tocadas recentemente',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: 200.0,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: _userViewModel.recentlyPlayedSongs.length,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _playerViewModel.playSongFromPlaylist(
                                  song: _userViewModel.recentlyPlayedSongs
                                      .elementAt(index),
                                  playlist: Playlist(
                                      playlistName: 'Tocadas recentemente',
                                      songs:
                                          _userViewModel.recentlyPlayedSongs),
                                );

                                Navigator.pushNamed(context, PlayerPage.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                              AssetsHelper.artworkFallback,
                                          image: _userViewModel
                                              .recentlyPlayedSongs
                                              ?.elementAt(index)
                                              ?.artworkURL,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        _userViewModel.recentlyPlayedSongs
                                                ?.elementAt(index)
                                                ?.title ??
                                            '',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Recomendado para você',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 200.0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _songsViewModel.recommendedSongs.length,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _playerViewModel.playSongFromPlaylist(
                          song:
                              _songsViewModel.recommendedSongs.elementAt(index),
                          playlist: Playlist(
                              playlistName: 'Músicas recomendadas',
                              songs: _songsViewModel.recommendedSongs),
                        );

                        Navigator.pushNamed(context, PlayerPage.id);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: AssetsHelper.artworkFallback,
                                    image: _songsViewModel.recommendedSongs
                                        .elementAt(index)
                                        ?.artworkURL,
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                _songsViewModel.recommendedSongs
                                    .elementAt(index)
                                    .title,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Observer(builder: (_) {
              return _playerViewModel.isPlaying
                  ? SizedBox(height: 70)
                  : SizedBox();
            })
          ],
        ),
      ),
    );
  }
}
