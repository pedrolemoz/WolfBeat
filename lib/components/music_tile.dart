import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../pages/player/player_page.dart';

class MusicTile extends StatelessWidget {
  MusicTile({@required this.index, this.image});

  final int index;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, PlayerPage.id);
        },
        onLongPress: () {
          // TODO: Refazer bottom sheet
          showBottomSheet(
              context: context,
              backgroundColor: Theme.of(context).backgroundColor,
              builder: (context) {
                return Container(
                  height: 150.0,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          leading: Icon(
                            FlutterIcons.trash_can_outline_mco,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Remover dos favoritos',
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
                          Navigator.pop(context);
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
              });
        },
        child: ListTile(
          leading: image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), child: image)
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Icon(
                      FlutterIcons.music_note_mdi,
                      color: Colors.white,
                    ),
                  ),
                ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Música ${index + 1}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                'Artista desconhecido',
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
