import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {
  String? url = dotenv.env['DEVELOPMENT_URL'];
  String api = "api/v1";
  String user = "api/v1/users";
  login(Map body) async {
    var uri = Uri.parse("$url$user/login/");
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));
    if (response.statusCode != 201) {
      return null;
    }
    return response.body;
  }

  register(Map body) async {
    var uri = Uri.parse("$url$user/register/");
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode != 201) {
      return null;
    }
    return response.body;
  }

  getTarotistas() async {
    var uri = Uri.parse("$url$api/listTarotistas");
    var response = await http.get(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode != 200) {
      return null;
    }
    return response.body;
  }
}
