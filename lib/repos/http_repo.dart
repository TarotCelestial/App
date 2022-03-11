import 'dart:convert';

import 'package:tarotcelestial/service/http_service.dart';

class HttpRepo {
  login(Map body) async{
    var data = await HttpService().login(body);
    if (data == null) {
      return null;
    }
    return jsonDecode(data);
  }

  register(Map body) async {
    var data = await HttpService().register(body);
    if (data == null) {
      return null;
    }
    return jsonDecode(data);
  }

  getTarotistas() async {
    var data = await HttpService().getTarotistas();
    if (data == null) {
      return null;
    }
    return jsonDecode(data);
  }

  getHoroscope() async {
    var data = await HttpService().getHoroscope();
    if (data == null) {
      return {};
    }

    return jsonDecode(data);
  }
  createChat(Map body, int userId, String token) async {
    var data = await HttpService().createChat(body, userId, token);
    if (data == null) {
      return null;
    }
    return data;
  }

  getPost() async {
    var data = await HttpService().getPost();
    if (data == null) {
      return {};
    }

    return jsonDecode(data);
  }
}
