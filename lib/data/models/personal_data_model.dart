import 'package:tarotcelestial/data/models/user_model.dart';

class PersonalData {
  Person? person;
  int? personType;
  String? accessToken;

  PersonalData({this.person, this.personType, this.accessToken});

  PersonalData.fromJson(Map<dynamic, dynamic> json) {
    person =
    json['person'] != null ? Person.fromJson(json['person']) : null;
    personType = json['personType'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (person != null) {
      data['person'] = person!.toJson();
    }
    data['personType'] = personType;
    data['accessToken'] = accessToken;
    return data;
  }
}

class Person {
  User? user;
  String? signo;

  Person({this.user, this.signo});

  Person.fromJson(Map<dynamic, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    signo = json['signo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['signo'] = signo;
    return data;
  }
}
