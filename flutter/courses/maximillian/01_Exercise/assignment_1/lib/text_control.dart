import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {

  final String mainText;

  TextControl(this.mainText);

  @override
  Widget build(BuildContext context) {
    return Text(mainText);
  }

}