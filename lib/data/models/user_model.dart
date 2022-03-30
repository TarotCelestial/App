class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? imagen;
  bool? online;

  String getImagen() {
    if (imagen == "") {
      return "https://st3.depositphotos.com/1767687/16607/v/600/depositphotos_166074422-stock-illustration-default-avatar-profile-icon-grey.jpg";
    }
    return imagen!;
  }

  User({this.email, this.firstName, this.lastName, this.imagen});

  User.fromJson(Map<dynamic, dynamic> json) {
    id = json["id"];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    imagen = json['imagen'];
    online = json['online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['imagen'] = imagen;
    data['online'] = online;
    return data;
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, firstName: $firstName, lastName: $lastName, imagen: $imagen, online: $online}';
  }
}
