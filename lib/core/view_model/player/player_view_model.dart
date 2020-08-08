import 'package:audioplayers/audioplayers.dart';
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
}
