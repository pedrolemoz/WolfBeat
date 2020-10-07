import 'package:WolfBeat/app/modules/playlist/pages/playlist_page.dart';
import 'package:WolfBeat/core/helpers/media_helper.dart';
import 'package:WolfBeat/core/view_model/song/songs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ArtistsTab extends StatelessWidget {
  final _artists = GetIt.I.get<SongsViewModel>().artists;
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
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaylistPage(
                playlistTitle: _artists.elementAt(index).artistName,
                songs: _mediaHelper.getSongsFromArtist(
                    artistName: _artists.elementAt(index).artistName),
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  _artists.elementAt(index).artworkURL,
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
