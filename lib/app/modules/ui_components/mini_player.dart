import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../core/helpers/assets_helper.dart';
import '../../../core/view_model/player/player_view_model.dart';
import '../player/pages/player_page.dart';

class MiniPlayer extends StatelessWidget {
  final playerViewModel = GetIt.I.get<PlayerViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            if (playerViewModel.playerQueue
                    .elementAt(playerViewModel.currentIndex) !=
                null) {
              Navigator.pushNamed(context, PlayerPage.id);
            }
          },
          onVerticalDragUpdate: (DragUpdateDetails details) {
            //TODO Ações para movimento vertical
            if (details.delta.dy > 0) {
              print("Dragging in +Y direction");
            } else {
              print("Dragging in -Y direction");
              if (playerViewModel.playerQueue
                      .elementAt(playerViewModel.currentIndex) !=
                  null) {
                Navigator.pushNamed(context, PlayerPage.id);
              }
              // Navigator.pop(context);
              // Navigator.pushNamed(context, PlayerPage.id);
            }
          },
          //TODO Ações para movimento horizontal
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            if (details.delta.dx > 0) {
              print("Dragging in +X direction");
            } else {
              print("Dragging in -X direction");
            }
          },
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Color(0xFF2c2f33),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 15,
                  offset: Offset(0, -10), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: FadeInImage.assetNetwork(
                          placeholder: AssetsHelper.artworkFallback,
                          image: playerViewModel?.playerQueue
                              .elementAt(playerViewModel.currentIndex)
                              ?.artworkURL,
                        ),
                      ),
                      VerticalDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            playerViewModel?.playerQueue
                                    .elementAt(playerViewModel.currentIndex)
                                    ?.title ??
                                'Música desconhecida',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            playerViewModel?.playerQueue
                                    .elementAt(playerViewModel.currentIndex)
                                    ?.artist ??
                                'Artista desconhecido',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await playerViewModel.favoriteSong();
                        },
                        child: Icon(
                          playerViewModel.isFavorite
                              ? FlutterIcons.favorite_mdi
                              : FlutterIcons.favorite_border_mdi,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      VerticalDivider(),
                      GestureDetector(
                        onTap: () {
                          playerViewModel.isPlaying
                              ? playerViewModel.pause()
                              : playerViewModel.play();
                        },
                        child: Icon(
                          playerViewModel.isPlaying
                              ? FlutterIcons.pause_mco
                              : FlutterIcons.play_mco,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// void modalBottomSheetMenu(context) {
//   WidgetsBinding.instance.addPostFrameCallback((_) async {
//     await showModalBottomSheet(
//         context: context,
//         builder: (builder) {
//           return MiniPlayer();
//         });
//   });
// }
