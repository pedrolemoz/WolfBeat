import 'package:WolfBeat/core/helpers/media_helper.dart';
import 'package:WolfBeat/core/view_model/song/songs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AlbumsTab extends StatelessWidget {
  final _albums = GetIt.I.get<SongsViewModel>().albums;
  final _mediaHelper = MediaHelper();
  @override
  Widget build(BuildContext context) {
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
      itemBuilder: (context,index) {
        return GestureDetector(
            onTap: () => _mediaHelper.getSongsFromAlbum(albumName:_albums.elementAt(index).albumName ),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  _albums.elementAt(index).artworkURL,
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
