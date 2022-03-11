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

  @override
  String toString() {
    return 'PersonalData{person: $person, personType: $personType, accessToken: $accessToken}';
  }
}

class Person {
  int? id;
  User? user;
  String? signo;
  String? pais;

  Person({this.id, this.user, this.signo, this.pais});

  Person.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    signo = json['signo'];
    pais= json['pais'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id']=id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['signo'] = signo;
    data['pais']=pais;
    return data;
  }

  @override
  String toString() {
    return 'Person{id: $id, user: $user, signo: $signo, pais: $pais}';
  }
}
