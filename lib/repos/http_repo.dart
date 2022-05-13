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
    return jsonDecode(utf8.decode(data));
  }

  getFullTarotistas() async {
    var data = await HttpService().getFullTarotistas();
    if (data == null) {
      return null;
    }
    return jsonDecode(utf8.decode(data));
  }

  getHoroscope() async {
    var data = await HttpService().getHoroscope();
    if (data == null) {
      return {};
    }

    return jsonDecode(utf8.decode(data));
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

  getQuestions(String token, int id) async {
    var data = await HttpService().getQuestions(token, id);
    if (data == null) {
      return;
    }
    return jsonDecode(data);
  }

  decreaseQuestions(String clientEmail, String token) async{
    var data = await HttpService().decreaseQuestions(clientEmail, token);
    if (data == null) {
      return;
    }
    return data;
  }

  increaseQuestions(int id, int bought, String token) async{
    var data = await HttpService().increaseQuestions(id, bought, token);
    if (data == null) {
      return;
    }
    return data;
  }

  changeOnlineStatus(int id, String token) async{
    var data = await HttpService().changeOnlineStatus(id, token);
    if (data == null) {
      return;
    }
    return data;
  }

  sendNotification(String token, String name, String message) async{
    var data = await HttpService().sendNotification(token, name, message);
    if (data == null) {
      return;
    }
    return data;
  }
}
