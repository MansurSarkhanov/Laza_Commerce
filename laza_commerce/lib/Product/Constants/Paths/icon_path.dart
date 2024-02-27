enum IconPath {
  google,
  home,
  favorite,
  favoritedrawer,
  bag,
  bagdrawer,

  product,
  menu,
  search,
  setting, sun, lock, logout, info

}

extension IconPathExtension on IconPath {
  String toPathSvg() {
    return 'assets/Icons/ic_$name.svg';
  }

  String toPathPng() {
    return 'assets/Icons/ic_$name.png';
  }
}
