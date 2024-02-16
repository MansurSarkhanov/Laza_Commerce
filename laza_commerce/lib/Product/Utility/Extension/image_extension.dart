enum ImagePath { logo }

extension ImagePathExtension on ImagePath {
  String toPath() {
    return "assets/Images/im_$name.svg";
  }
}
