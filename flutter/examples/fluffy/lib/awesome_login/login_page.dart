import 'package:flutter/material.dart';
import '../commons/widgets/common.dart';

import './theme.dart' as Theme;
import './bubble_indication_painter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CommonWidgets.buildSideDrawer(context),
      appBar: AppBar(
        title: Text('Fluffy'),
        actions: <Widget>[],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          debugPrint('Scroll');
          overScroll.disallowGlow();
        },
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 775.0,
            decoration: new BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Theme.Colors.loginGradientStart,
                      Theme.Colors.loginGradientEnd
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 75.0),
                  child: Image(
                      width: 250.0,
                      height: 191.0,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/login_logo.png')),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _buildMenuBar(context),
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) {
                      if (i == 0) {
                      } else if (i == 1) {}
                    },
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
          color: Color(0x552b2b2b),
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignInButtonPress,
                child: Text(
                  'Existing',
                  style: TextStyle(
                      color: left,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  'New',
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansSemiBold'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[Stack(), Padding(), Padding(), Row()],
      ),
    );
  }

  void _onSignInButtonPress() {}

  void _onSignUpButtonPress() {}
}