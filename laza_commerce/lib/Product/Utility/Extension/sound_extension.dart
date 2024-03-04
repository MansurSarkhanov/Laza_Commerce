enum SoundPath { sound }

extension SoundPathExtesion on SoundPath {
  String toPathMp3() {
    return 'Audio/$name.mp3';
  }
}
