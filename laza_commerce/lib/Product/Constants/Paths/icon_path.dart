enum IconPath {
  google,
  home,
  favorite,
  bag,
  product,
  menu,
  search,
}

extension IconPathExtension on IconPath {
  String toPathSvg() {
    return 'assets/Icons/ic_$name.svg';
  }

  String toPathPng() {
    return 'assets/Icons/ic_$name.png';
  }
}
