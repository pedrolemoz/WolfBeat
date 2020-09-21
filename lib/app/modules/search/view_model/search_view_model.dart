import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/models/song/song.dart';

part 'search_view_model.g.dart';

/// [SearchViewModel] has methods to perform searchs in database.
/// Used in [SearchPage].
class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

/// This is a [Store] for [SearchViewModel]
abstract class _SearchViewModelBase with Store {
  @observable
  Iterable<Song> searchResult = [];

  @action
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
                  reference: song.reference.path,
                ));
      });

  @action
  void cleanResults() {
    if (searchResult.isNotEmpty) {
      searchResult = Iterable.empty();
    }
  }
}
