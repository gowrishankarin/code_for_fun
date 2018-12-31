import 'package:flutter/material.dart';
import '../commons/widgets/common.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key key
  }): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CommonWidgets.buildSideDrawer(context),
      appBar: AppBar(
        title: Text('Fluffy'),
        actions: <Widget>[

        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        child: SingleChildScrollView(),
      ),
    );
  }


}