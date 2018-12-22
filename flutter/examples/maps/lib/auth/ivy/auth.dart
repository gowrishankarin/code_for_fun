import 'dart:async';
import 'dart:convert' as Convert;

import 'package:http/http.dart' as http;

import '../../config.dart';

class IvyAuth {
  Future<Map<String, dynamic>> authenticate(
      String email, String password) async {
    http.Response response = await http.post(
      CONFIGURATIONS.ivyLocalAuthEndPoint,
      body: Convert.json.encode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    final Map<String, dynamic> responseData =
        Convert.json.decode(response.body);

    print('AUTH IVY');
    print(responseData);
    return {'success': 'SUCCESS', 'payload': responseData};
  }
}

class IvyAPIs {
  Future<List<dynamic>> callIvyAPIs(
      String url, String token, String role) async {
    
    return http.get(
      CONFIGURATIONS.ivyEndPoint + url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ).then<List<dynamic>>((http.Response response) {
      final responseList = Convert.json.decode(response.body);
      print(responseList);
      return responseList;
    });
  }
}
