import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/helpers/firebase_helper.dart';
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
  Future<void> performSearch(String search) => Firestore.instance
          .collection(FirebaseHelper.songsCollection)
          .getDocuments()
          .then((snapshot) {
        searchResult = snapshot.documents
            .where((songSnapshot) =>
                // TODO: Usar regex para fazer o match
                songSnapshot.data[FirebaseHelper.titleAttribute]
                    .startsWith(search) ||
                songSnapshot.data[FirebaseHelper.artistAttribute]
                    .startsWith(search) ||
                songSnapshot.data[FirebaseHelper.albumAttribute]
                    .startsWith(search) ||
                songSnapshot.data[FirebaseHelper.genreAttribute]
                    .startsWith(search))
            .map((song) => Song(
                  title: song.data[FirebaseHelper.titleAttribute],
                  album: song.data[FirebaseHelper.albumAttribute],
                  artist: song.data[FirebaseHelper.artistAttribute],
                  artworkURL: song.data[FirebaseHelper.artworkURLAttribute],
                  backgroundColor:
                      song.data[FirebaseHelper.backgroundColorAttribute],
                  duration: song.data[FirebaseHelper.durationAttribute],
                  genre: song.data[FirebaseHelper.genreAttribute],
                  songURL: song.data[FirebaseHelper.songURLAttribute],
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
