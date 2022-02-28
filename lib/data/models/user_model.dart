class User {
  String? email;
  String? firstName;
  String? lastName;
  String? imagen;

  String getImagen() {
    if (imagen == "") {
      return "https://st3.depositphotos.com/1767687/16607/v/600/depositphotos_166074422-stock-illustration-default-avatar-profile-icon-grey.jpg";
    }
    return imagen!;
  }

  User({this.email, this.firstName, this.lastName, this.imagen});

  User.fromJson(Map<dynamic, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    imagen = json['imagen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['imagen'] = imagen;
    return data;
  }
}
