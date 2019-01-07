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

// https://uigradients.com
class Gradients {
  Color colors;

  static const megatron = const LinearGradient(
    colors: const[Color(0xffc6ffdd), Color(0xfffbd786), Color(0xfff7797d)],
    stops: const [0.0, 0.5, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp
  );

  static const margo = const LinearGradient(
    colors: const[Color(0xffFFEFBA), Color(0xffffffff)],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp
  );

  static const summerDog = const LinearGradient(
    colors: const[Color(0xffa8ff78), Color(0xff78ffd6)],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp
  );

  static const relaxingRed = const LinearGradient(
    colors: const[Color(0xfffffbd5), Color(0xffb20a2c)],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp
  );

  static const limeade = const LinearGradient(
    colors: const[Color(0xffA1FFCE), Color(0xffFAFFD1)],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp
  );

  static const sunnyDays = const LinearGradient(
    colors: const[Color(0xffEDE574), Color(0xffE1F5C4)],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp
  );

  static const pinotNoir = const LinearGradient(
    colors: const[Color(0xff4b6cb7), Color(0xff182848)],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp
  );

  static const seaBlizz = const LinearGradient(
    colors: const[Color(0xff1CD8D2), Color(0xff93EDC7)],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp
  );
}