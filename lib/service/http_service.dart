import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
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
      return;
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
    if (response.statusCode != 201) {
      return;
    }
    return response.body;
  }

  getTarotistas() async {
    var uri = Uri.parse("$url$api/tarotistas");
    var response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    });
    if (response.statusCode != 200) {
      return;
    }
    return response.bodyBytes;
  }

  getFullTarotistas() async {
    var uri = Uri.parse("$url$api/tarotistas/listfull/");
    var response = await http.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    });
    if (response.statusCode != 200) {
      return;
    }
    return response.bodyBytes;
  }

  getHoroscope() async {
    var uri = Uri.parse("https://tarot-celestial.herokuapp.com/api/v1/horoscope/");
    var response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode != 200) {
      return;
    }
    return response.bodyBytes;
  }

  createChat(Map body, int userId, String token) async {
    var uri = Uri.parse("$url$api/createChat/$userId/");
    var response = await http.patch(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Token $token"
        },
        body: jsonEncode(body));
    if (response.statusCode != 200) {
      return;
    }
    return response.statusCode;
  }

  getPost() async {
    var uri = Uri.parse("$url$api/post/");
    var response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode != 200) {
      return;
    }
    return response.body;
  }

  firebaseUploadPhoto(File file, String name, int userId, String token) async {
    String? url;
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    try {
      await storage.ref('tarotistas/$name').putFile(file);
      url = await storage.ref('tarotistas/$name').getDownloadURL();
    } catch (e) {
      print(e);
    }
    if (url == null) {
      return;
    }
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .update({'imageUrl': url});
    await changePhoto({"url": url}, userId, token);
    return url;
  }

  changePhoto(Map body, int userId, String token) async {
    var uri = Uri.parse("$url$api/changePhoto/$userId/");
    var response = await http.patch(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Token $token"
        },
        body: jsonEncode(body));
    if (response.statusCode != 200) {
      return;
    }
    return response.statusCode;
  }

  getQuestions(String token, int id) async {
    var uri = Uri.parse("$url$api/ask/$id/");
    var response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Token $token"
    });
    if (response.statusCode != 200) {
      return;
    }
    return response.body;
  }

  decreaseQuestions(String clientEmail, String token) async {
    var uri = Uri.parse("$url$api/decreaseQuestions/");
    var response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Token $token",
      },
        body: jsonEncode({"email": clientEmail})
    );
    return response.statusCode;
  }

  increaseQuestions(int id, int bought, String token) async {
    var uri = Uri.parse("$url$api/increaseQuestions/$id/");
    var response = await http.patch(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Token $token"
      },
      body: jsonEncode({'questions': bought})
    );
    if (response.statusCode != 200) {
      return;
    }
    return response.statusCode;
  }

  changeOnlineStatus(int id, String token) async {
    var uri = Uri.parse("$url$api/onlineStatus/$id/");
    var response = await http.patch(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Token $token"
        },
    );
    if (response.statusCode != 200) {
      return;
    }
    return jsonDecode(response.body)["status"];
  }
}
