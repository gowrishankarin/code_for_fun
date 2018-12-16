import 'package:flutter/material.dart';

import 'flip_box.dart';

/// Top level widget for Bottom NavigatorBar
class FlipBoxBar extends StatefulWidget {
  /// The items to be displayed in the BottomNavBar
  final List<FlipBarItem> items;
  /// The duration of the animation of the box flip
  final Duration animationDuration;
  /// Callback for getting value of item selection.
  final ValueChanged<int> onIndexChanged;
  /// The initial selected index of the NavBar
  final int initialIndex;
  /// The height of the BottomNavBar
  final double navBarHeight;

  FlipBoxBar({
    this.items,
    this.animationDuration = const Duration(seconds: 1),
    @required this.onIndexChanged,
    this.initialIndex = 0,
    this.navBarHeight = 100.0
  });
  
  @override
  _FlipBoxBarState createState() => _FlipBoxBarState();
}

class _FlipBoxBarState extends State<FlipBoxBar> with TickerProviderStateMixin {

  /// Hosts all the controller controlling the box
  List<AnimationController> _controllers = [];
  /// The current chosen index
  int indexChosen = 0;

  @override
  void initState() {
    super.initState();

    // Initialize all animation controllers
    for(int i=0; i < widget.items.length; i++) {
      _controllers.add(
        AnimationController(vsync: this, duration: widget.animationDuration)
      );
    }
    _controllers[widget.initialIndex].forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(

        children: widget.items.map((item) {
          int index = widget.items.indexOf(item);
          // create the boxes in the NavBar
          return Expanded(child: _FlipBarElement(
            item.icon, item.text, item.frontColor, item.backColor, _controllers[index],
            _onTapped, index, widget.navBarHeight
          ),);
        }).toList(),),

    );
  }

  void _onTapped(int index) {
    _controllers[indexChosen].reverse();
    indexChosen = index;
    _controllers[indexChosen].forward();
    widget.onIndexChanged(index);
  }
}

class FlipBarItem {
  /// The icon to be displayed on the sizes (Can be replaced by any other widget)\
  final Widget icon;
  /// The text to be displayed when item is selected (Can be replaced bby any other widget)
  final Widget text;
  /// The color of the front side (Originally towards the user)
  final Color frontColor;
  /// The color of the top side (Towards the user when selected)
  final Color backColor;

  FlipBarItem({
    @required this.icon,
    @required this.text,
    this.frontColor = Colors.blueAccent,
    this.backColor = Colors.blue
  });
}

class _FlipBarElement extends StatelessWidget {
  /// Passing down icon widget from upper widget
  final Widget icon;
  /// Passing down text widget from upper widget
  final Widget text;
  /// Passing down widget from upper widget
  final Color frontColor;
  /// Passing down widget from upper widget
  final Color backColor;
  /// Passing down widget from upper widget
  final AnimationController controller;
  /// Passing down widget from upper widget
  final ValueChanged<int> onTapped;
  /// The index of the box
  final index;
  // Passing down widget from upper widget
  final double appBarHeight;

  _FlipBarElement(this.icon, this.text, this.frontColor, this.backColor, 
    this.controller, this.onTapped, this.index, this.appBarHeight,);

  @override
  Widget build(BuildContext context) {
    return FlipBox(
      height: appBarHeight,
      controller: controller,
      onTrapped: () {
        onTapped(index);
      },
      bottomChild: Container(
        width: double.infinity,
        height: double.infinity,
        color: backColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[icon, text,],),
      ),
      topChild: Container(
        width: double.infinity,
        height: double.infinity,
        color: frontColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[icon,],
        ),
      ),
    );
  }
}