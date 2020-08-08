import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/models/song/song.dart';

/// [SearchViewModel] has methods to perform searchs in database.
/// Used in [SearchPage].
class SearchViewModel extends ChangeNotifier {
  Iterable<Song> searchResult = [];

  Future<void> performSearch(String search) =>
      Firestore.instance.collection('songs').getDocuments().then((snapshot) {
        searchResult = snapshot.documents
            .where((songSnapshot) =>
                // TODO: Usar regex para fazer o match
                songSnapshot.data['title'].startsWith(search) ||
                songSnapshot.data['artist'].startsWith(search) ||
                songSnapshot.data['album'].startsWith(search) ||
                songSnapshot.data['genre'].startsWith(search))
            .map((song) => Song(
                  title: song.data['title'],
                  album: song.data['album'],
                  artist: song.data['artist'],
                  artworkURL: song.data['artworkURL'],
                  backgroundColor: song.data['backgroundColor'],
                  duration: song.data['duration'],
                  genre: song.data['genre'],
                  songURL: song.data['songURL'],
                ));

        notifyListeners();
      });

  void cleanResults() {
    if (searchResult.isNotEmpty) {
      searchResult = Iterable.empty();
      notifyListeners();
    }
  }
}
