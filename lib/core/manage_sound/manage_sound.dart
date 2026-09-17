import 'package:just_audio/just_audio.dart';

class ManageSound {
  static AudioPlayer player = AudioPlayer();

  static void playSound(String url) async {
    await player.play();
  }

  static void stopSound() async {
    await player.stop();
  }
}
