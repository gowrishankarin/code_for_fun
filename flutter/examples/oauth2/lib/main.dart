import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import './config.dart';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

String selectedUrl = 'https://flutter.io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web View Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: _getRouteSettings(),
    );
  }

  _getRouteSettings() {
    return {
      '/': (_) => MyHomePage(title: 'Flutter Web View Demo'),
      '/widget': (_) {
        return WebviewScaffold(
          url: selectedUrl,
          withZoom: true,
          userAgent: kAndroidUserAgent,
          //clearCache: true,
          //clearCookies: true,
          // appBar: AppBar(
          //   title: const Text('Widget Web View'),
          // ),
          // withZoom: true,
          // withLocalStorage: true,
          // hidden: true,
          // initialChild: Container(
          //   color: Colors.redAccent,
          //   child: const Center(
          //     child: Text('Waiting...'),
          //   ),
          // ),
          // bottomNavigationBar: BottomAppBar(
          //   child: Row(
          //     children: <Widget>[
          //       IconButton(
          //         icon: const Icon(Icons.arrow_back_ios),
          //         onPressed: () {
          //           flutterWebviewPlugin.goBack();
          //         },
          //       ),
          //       IconButton(
          //         icon: Icon(Icons.arrow_forward_ios),
          //         onPressed: () {
          //           flutterWebviewPlugin.goForward();
          //         },
          //       ),
          //       IconButton(
          //         icon: Icon(Icons.autorenew),
          //         onPressed: () {
          //           flutterWebviewPlugin.reload();
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        );
      }
    };
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();
  StreamSubscription _onDestroy;
  StreamSubscription<String> _onUrlChanged;

  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  StreamSubscription<double> _onScrollYChanged;
  StreamSubscription<double> _onScrollXChanged;

  final _urlCtrl = TextEditingController(text: selectedUrl);
  final _codeCtrl = TextEditingController(text: 'window.navigator.userAgent');
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _history = [];

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.close();

    _urlCtrl.addListener(() {
      selectedUrl = _urlCtrl.text;
    });

    _onDestroy = flutterWebviewPlugin.onDestroy.listen((_) {
      if (mounted) {
        _scaffoldKey.currentState.showSnackBar(
          const SnackBar(
            content: const Text('Web View Destroyed'),
          ),
        );
      }
    });

    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        setState(() {
          _history.add('onUrlChanged: $url');
          if (url.startsWith(CONFIGURATIONS.redirectUri)) {
            String code = (Uri.parse(url).queryParameters.values.toList()[0]);
            debugPrint(code);
            print(url);
            flutterWebviewPlugin.close();
            Navigator.of(context).pushNamed('/');

            // Make a post call for access token with following payload.
            // /oauth2/v4/token

            //code=4/P7q7W91a-oMsCeLvIaQm6bTrgtp7&
            // client_id=your_client_id&
            // client_secret=your_client_secret&
            // redirect_uri=https://oauth2.example.com/code&
            // grant_type=authorization_code

            
          }
        });
      }
    });

    _onScrollYChanged =
        flutterWebviewPlugin.onScrollYChanged.listen((double y) {
      if (mounted) {
        setState(() {
          _history.add('Scroll in Y Direction: $y');
        });
      }
    });

    _onScrollXChanged =
        flutterWebviewPlugin.onScrollXChanged.listen((double x) {
      if (mounted) {
        setState(() {
          _history.add('Scroll in X Direction: $x');
        });
      }
    });

    _onStateChanged =
        flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (mounted) {
        setState(() {
          _history.add('onStateChanged: ${state.type} ${state.url}');
        });
      }
    });

    _onHttpError =
        flutterWebviewPlugin.onHttpError.listen((WebViewHttpError error) {
      if (mounted) {
        setState(() {
          _history.add('onHttpError: ${error.code} ${error.url}');
        });
      }
    });
  }

  @override
  void dispose() {
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    _onScrollXChanged.cancel();
    _onScrollYChanged.cancel();

    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: _urlCtrl,
              ),
            ),
            RaisedButton(
              onPressed: () {
                flutterWebviewPlugin.launch(selectedUrl,
                    rect: Rect.fromLTWH(
                        0.0, 0.0, MediaQuery.of(context).size.width, 300.0),
                    userAgent: kAndroidUserAgent);
              },
              child: const Text('Open Web View (rect)'),
            ),
            RaisedButton(
              onPressed: () {
                flutterWebviewPlugin.launch(selectedUrl, hidden: true);
              },
              child: const Text('Open "hidden" Web View'),
            ),
            RaisedButton(
              onPressed: () {
                flutterWebviewPlugin.launch(selectedUrl);
              },
              child: const Text('Open Fullscreen Webview'),
            ),
            RaisedButton(
              onPressed: () {
                selectedUrl = 'https://github.com';
                Navigator.of(context).pushNamed('/widget').then((response) {
                  print(response);
                });
              },
              child: const Text('Open widget webview'),
            ),
            RaisedButton(
              onPressed: () {
                Map<String, String> queryParams = {
                  'client_id': CONFIGURATIONS.googleAppId,
                  'redirect_uri': CONFIGURATIONS.redirectUri,
                  'response_type': 'code',
                  'scope': 'email'
                };

                String uri = Uri.https(
                  'accounts.google.com',
                  '/o/oauth2/v2/auth',
                  queryParams,
                ).toString();
                selectedUrl = uri;
                Navigator.of(context).pushNamed('/widget').then((response) {
                  //print(response);
                });
              },
              child: const Text('Ivy Sign In'),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: _codeCtrl,
              ),
            ),
            RaisedButton(
              child: const Text('Close'),
              onPressed: () {
                setState(() {
                  _history.clear();
                });
                flutterWebviewPlugin.close();
              },
            ),
            RaisedButton(
              onPressed: () {
                flutterWebviewPlugin.getCookies().then((m) {
                  setState(() {
                    _history.add('cookies: $m');
                  });
                });
              },
              child: const Text('Cookies'),
            ),
            Text(_history.join('\n'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
