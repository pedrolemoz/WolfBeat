import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/models/song/song.dart';

/// [PlayerViewModel] has the methods for the music player.
/// Used in [MusicTile], [PlayerPage].
class PlayerViewModel extends ChangeNotifier {
  Song currentSong;
  bool isPlaying = false;
  int currentTime;

  AudioPlayer audioPlayer = AudioPlayer();

  void updateCurrentSong(Song newSong) {
    currentSong = newSong;
    notifyListeners();
  }

  Future<void> play() async {
    var result = await audioPlayer.play(currentSong.songURL);
    if (result == 1) {
      print('Reproduzindo');
      isPlaying = true;
      notifyListeners();
    }
  }

  Future<void> pause() async {
    print(currentSong.songURL);
    var result = await audioPlayer.pause();
    if (result == 1) {
      print('Pausado');
      isPlaying = false;
      notifyListeners();
    }
  }

  Future<void> stop() async {
    print(currentSong.songURL);
    var result = await audioPlayer.stop();
    if (result == 1) {
      print('Parado');
      isPlaying = false;
      notifyListeners();
    }
  }
}
