import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

import '../../models/song.dart';

class PlayerController extends ChangeNotifier {
  Song currentSong;
  bool isPlaying = false;
  int currentTime;

  var audioPlayer = AudioPlayer();

  void updateCurrentSong(Song newSong) {
    currentSong = newSong;
    notifyListeners();
  }

  Future<void> play() async {
    int result = await audioPlayer.play(currentSong.songURL);
    if (result == 1) {
      print('Reproduzindo');
      isPlaying = true;
      notifyListeners();
    }
  }

  Future<void> pause() async {
    print(currentSong.songURL);
    int result = await audioPlayer.pause();
    if (result == 1) {
      print('Pausado');
      isPlaying = false;
      notifyListeners();
    }
  }

  Future<void> stop() async {
    print(currentSong.songURL);
    int result = await audioPlayer.stop();
    if (result == 1) {
      print('Parado');
      isPlaying = false;
      notifyListeners();
    }
  }
}
