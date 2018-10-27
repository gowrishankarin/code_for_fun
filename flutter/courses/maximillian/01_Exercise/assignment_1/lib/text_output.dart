import 'package:flutter/material.dart';
import './text_control.dart';

class TextOutput extends StatefulWidget {
  final String mainText;

  TextOutput(this.mainText);

  @override
  State<StatefulWidget> createState() {
    return _TextOutputState();
  }
}

class _TextOutputState extends State<TextOutput> {
  String _mainText;

  @override
  void initState() {
    _mainText = widget.mainText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          onPressed: () {
            setState(() {
              _mainText = 'Changed Text';
            });
            
          },
          child: Text('Change Text')
        ),
        TextControl(_mainText)
      ],
    );
  }
}
