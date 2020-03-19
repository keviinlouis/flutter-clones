import 'package:flutter/material.dart';

class AccountVisibilityState extends ChangeNotifier {
  double _accountVisibility = 0;

  AnimationController animation;
  Tween<double> tween;

  double get accountVisibility => _accountVisibility;

  get opacity => accountVisibility / 100;

  get opacityInverse => (100 - accountVisibility) / 100;

  bool get completed => accountVisibility.ceilToDouble() >= 99;

  set accountVisibility(double accountVisibility) {
    _accountVisibility = accountVisibility;
    notifyListeners();
  }
}
