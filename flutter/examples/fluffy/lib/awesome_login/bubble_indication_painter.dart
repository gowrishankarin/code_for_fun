import 'dart:math';

import 'package:flutter/material.dart';

class TabIndicationPainter extends CustomPainter {

  final PageController pageController;

  TabIndicationPainter({
    this.pageController
  }):super(repaint: pageController);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }

}