import 'package:tarotcelestial/data/models/user_model.dart';

class PersonalData {
  int? id;
  Person? person;
  int? personType;
  String? accessToken;

  PersonalData({this.id, this.person, this.personType, this.accessToken});

  PersonalData.fromJson(Map<dynamic, dynamic> json) {
    id=json["id"];
    person =
    json['person'] != null ? Person.fromJson(json['person']) : null;
    personType = json['personType'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
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
  String? pais;

  Person({this.user, this.signo, this.pais});

  Person.fromJson(Map<dynamic, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    signo = json['signo'];
    pais= json['pais'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['signo'] = signo;
    data['pais']=pais;
    return data;
  }
}
