import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

Future<Stream<String>> _server() async {
  final StreamController<String> onCode = StreamController();
  HttpServer server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
  server.listen((HttpRequest request) async {
    final String code = request.uri.queryParameters["code"];
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

Future<Token> getToken(String appId, String appSecret) async {
  print('SERVER CREATED');
  
  Stream<String> onCode = await _server();
  String url = "https://accounts.google.com/o/oauth2/v2/auth";
  print('SERVER CREATED');
  final FlutterWebviewPlugin webviewPlugin = FlutterWebviewPlugin();
  webviewPlugin.launch(url, clearCache: true, clearCookies: true);
  print('URL LAUNCH');
  final String code = await onCode.first;
  webviewPlugin.close();

  final http.Response response = await http.get('');

  return null;
  //return new Token.fromMap(json.decode(response.body));
}

class Token {
  final String access;
  final String type;
  final num expiresIn;

  Token(this.access, this.type, this.expiresIn);
}

class Id{
  final String id;
  Id(this.id);
}

class Cover {
  final String id;
  final int offsetY;
  final String source;

  Cover(this.id, this.offsetY, this.source);

  Cover.fromMap(Map<String, dynamic> json)
    : id = json['id'], offsetY=json['offset_y'], source=json['source'];
}

class PublicProfile extends Id {
  final Cover cover;
  final String name;

  PublicProfile.fromMap(Map<String, dynamic> json)
    : cover=json.containsKey('cover') ? new Cover.fromMap(json['cover']) : null,
      name=json['name'], super(json['id']);
}

class FacebookGraph {
  final String _baseUrl = "";
  final Token token;

  FacebookGraph(this.token);

  Future<PublicProfile> me(List<String> fields) async {
    String _fields = fields.join(",");

    final http.Response response = await http
      .get('$_baseUrl/me?fields=$fields=&access_token=${token.access}');

    return new PublicProfile.fromMap(json.decode(response.body));
  }
}