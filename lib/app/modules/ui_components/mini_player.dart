import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get_it/get_it.dart';

import '../../../core/helpers/assets_helper.dart';
import '../../../core/view_model/player/player_view_model.dart';
import '../player/pages/player_page.dart';

class MiniPlayer extends StatelessWidget {
  MiniPlayer();

  final playerViewModel = GetIt.I.get<PlayerViewModel>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails details) {
        //TODO Ações para movimento vertical
        if (details.delta.dy > 0) {
          print("Dragging in +Y direction");
        } else {
          print("Dragging in -Y direction");
          Navigator.pop(context);
          Navigator.pushNamed(context, PlayerPage.id);
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
        color: Color(0xFF2c2f33),
        height: 100,
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: FadeInImage.assetNetwork(
                    placeholder: AssetsHelper.artworkFallback,
                    image: playerViewModel?.currentSong?.artworkURL,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  playerViewModel?.currentSong?.title ?? 'Música desconhecida',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  playerViewModel?.currentSong?.artist ??
                      'Artista desconhecido',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 140.0),
              child: Row(
                children: [
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
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void modalBottomSheetMenu(context) {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await showModalBottomSheet(
        context: context,
        builder: (builder) {
          return MiniPlayer();
        });
  });
}
