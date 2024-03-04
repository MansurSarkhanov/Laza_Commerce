import 'package:audioplayers/audioplayers.dart';

class AudioControllers {
  final _audioPlayer = AudioPlayer();

  Future<void> playSound({required String path}) async {
    await _audioPlayer.play(AssetSource(
      path,
    ));
  }
}
