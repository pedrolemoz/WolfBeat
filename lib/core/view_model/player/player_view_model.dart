import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../../models/song/song.dart';

part 'player_view_model.g.dart';

/// [PlayerViewModel] controls the music player.
/// Used in [MusicTile], [PlayerPage].
class PlayerViewModel = _PlayerViewModelBase with _$PlayerViewModel;

/// This is a [Store] for [PlayerViewModel]
abstract class _PlayerViewModelBase with Store {
  @observable
  Song currentSong;

  @observable
  bool isPlaying = false;

  @observable
  int currentTime;

  AudioPlayer audioPlayer = AudioPlayer();

  // ignore: use_setters_to_change_properties
  @action
  void updateCurrentSong(Song newSong) => currentSong = newSong;

  @action
  Future<void> play() async {
    var result = await audioPlayer.play(currentSong.songURL);
    if (result == 1) {
      debugPrint('Reproduzindo');
      isPlaying = true;
    }
  }

  @action
  Future<void> pause() async {
    debugPrint(currentSong.songURL);
    var result = await audioPlayer.pause();
    if (result == 1) {
      debugPrint('Pausado');
      isPlaying = false;
    }
  }

  @action
  Future<void> stop() async {
    debugPrint(currentSong.songURL);
    var result = await audioPlayer.stop();
    if (result == 1) {
      debugPrint('Parado');
      isPlaying = false;
    }
  }

  @action
  Future<void> favoriteSongs() async {
    var database = Firestore.instance;
    var auth = FirebaseAuth.instance;
    var verif = true;
    var user = await auth.currentUser();
    var userData = await database.collection('users').document(user.uid).get();
    var listUserData = userData.data['favoriteSongs'] as List;
    for (DocumentReference i in listUserData) {
      if (i.path == currentSong.reference) {
        verif = false;
        print("Mesma musica");
      }
      print(currentSong.reference);
    }

    if (verif) {
      listUserData.add(database.document(currentSong.reference));
      database
          .collection('users')
          .document(user.uid)
          .updateData({'favoriteSongs': listUserData});
    }
  }
}
