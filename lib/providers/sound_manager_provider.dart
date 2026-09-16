import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SoundManagerProvider extends ChangeNotifier {
  late AudioPlayer player;
  bool? isPlayer;
  double rate = 1.0;
  String? currentUrl;

  SoundManagerProvider() {
    player = AudioPlayer();
    player.playingStream.listen((playing) {
      isPlayer = playing;
      notifyListeners();
    });
  }

  Future<void> play(String url) async {
    try {
      if (currentUrl == url) {
        if (isPlayer == true) {
          await player.pause();
        } else {
          await player.play();
        }
      } else {
        await player.stop();
        currentUrl = url;

        print('URL: $url');

        await player.setUrl(url);
        await player.play();
      }

      notifyListeners();
    } catch (e) {
      print('AUDIO ERROR: $e');
    }
  }

  Future<void> stop(String url) async {
    if (currentUrl == url) {
      await player.stop();
      currentUrl = null;
    }
    notifyListeners();
  }

  Future<void> mute(String url, double rate) async {
    if (currentUrl == url) {
      this.rate = rate;
      await player.setVolume(rate);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }
}
