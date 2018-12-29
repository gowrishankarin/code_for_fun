import 'dart:async';
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';


// https://www.didierboelens.com/2018/04/facebook-oauth-login-with-flutter---solution/
// https://github.com/WillyShakes/flutter_auth/blob/master/lib/instagram.dart
class IvySignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IvySignInState();
  }
}

class _IvySignInState extends State<IvySignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ivy Sign In'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text('Sign In'),
              onPressed: () {
                //setState(() {
                                  
                                
                var response = _getToken(
                    CONFIGURATIONS.googleAppId,
                    CONFIGURATIONS.googleSecret);

                   // });
              },
            ),
          ),
        ],
      ),
    );
  }

  Future _getToken(String appId, String appSecret) async {
    print('CREATE SERVER');
  
    Stream<String> onCode = await _server();
    print('SERVER CREATED');

    Map<String, String> queryParams = {
      'client_id': appId,
      'redirect_uri': Uri.encodeFull("https://curiosity.ivy-insights.com/auth/google/callback"),
      'response_type': 'code',
      //'access_type': 'offline',
      //'include_granted_scopes': 'true',
      //'state': 'state_parameter_passthrough_value',
      //'prompt': 'consent',
      'scope':'email%20profile'
    };

    print(queryParams);

    

    String uri = Uri.https('accounts.google.com', '/o/oauth2/v2/auth', queryParams).toString();
  
    final FlutterWebviewPlugin webviewPlugin = FlutterWebviewPlugin();
    
    webviewPlugin.launch(uri, clearCache: true, clearCookies: true).then((response) {
      print('LAUNCH RESPONSE');
      print(response);
    });
    print('URL LAUNCH');
    final String code = await onCode.first;
    print('CODE');
    print(code);
    webviewPlugin.close();

    final http.Response response = await http.get('');

    return null;
    //return new Token.fromMap(json.decode(response.body));
  }

  Future<Stream<String>> _server() async {
    final StreamController<String> onCode = StreamController();
    print(InternetAddress.LOOPBACK_IP_V4);
    HttpServer server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 9000);
    server.listen((HttpRequest request) async {
      final String code = request.uri.queryParameters["code"];
      print(code);
      request.response
        ..statusCode=200
        ..headers.set("Content-Type", ContentType.html.mimeType)
        ..write("<html>You can now close this window</html>");

      await request.response.close();
      await server.close(force: true);
      onCode.add(code);
      await onCode.close();
    });
    return onCode.stream;
  }

}
