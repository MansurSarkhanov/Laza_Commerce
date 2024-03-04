import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isProductSend = false;
  void changeLoading() {
    isProductSend = !isProductSend;
    notifyListeners();
  }
}
