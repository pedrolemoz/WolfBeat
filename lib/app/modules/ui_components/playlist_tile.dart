import 'package:WolfBeat/app/modules/playlist/pages/playlist_page.dart';
import 'package:WolfBeat/app/modules/ui_components/music_tile.dart';
import 'package:WolfBeat/core/helpers/firebase_helper.dart';
import 'package:WolfBeat/core/models/playlist/playlist.dart';
import 'package:WolfBeat/core/models/song/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/assets_helper.dart';

/// [PlaylistTile] is a widget that redirects the user to ***.
/// It's a Container with the first 4 music cover of the playlist inside.
/// Used in [PlaylistsTab].

class PlaylistTile extends StatelessWidget {
  PlaylistTile({this.playlist});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    var musicTiles = <MusicTile>[];

    playlist.songs.forEach(
      (playlistSong) async {
        final _playlistSong = playlistSong as DocumentReference;
        final song = await _playlistSong.get();

        musicTiles.add(
          MusicTile(
            playlistName: playlist.playlistName,
            song: Song(
              title: song.data[FirebaseHelper.titleAttribute],
              songURL: song.data[FirebaseHelper.songURLAttribute],
              album: song.data[FirebaseHelper.albumAttribute],
              artist: song.data[FirebaseHelper.artistAttribute],
              artworkURL: song.data[FirebaseHelper.artworkURLAttribute],
              duration: song.data[FirebaseHelper.durationAttribute],
              genre: song.data[FirebaseHelper.genreAttribute],
              backgroundColor:
                  song.data[FirebaseHelper.backgroundColorAttribute],
              reference: song.reference,
            ),
          ),
        );
      },
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaylistPage(
              songs: musicTiles,
              playlistTitle: playlist.playlistName,
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
                itemBuilder: (context, _) {
                  return Image.asset(AssetsHelper.artworkFallback);
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
