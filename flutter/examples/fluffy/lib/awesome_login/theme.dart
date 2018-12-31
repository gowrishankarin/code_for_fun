import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {
  const Colors();

  static const Color loginGradientStart = const Color(0xfffbab66);
  static const Color loginGradientEnd = const Color(0xfff7418c);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  );
}