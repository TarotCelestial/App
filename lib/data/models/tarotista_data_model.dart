class Tarotista {
  User? user;
  String? sobre;
  String? experiencia;
  String? nombreArtistico;
  int? precioChat;
  List<Especialidades>? especialidades;

  Tarotista(
      {this.user,
        this.sobre,
        this.experiencia,
        this.nombreArtistico,
        this.precioChat,
        this.especialidades});

  Tarotista.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    sobre = json['sobre'];
    experiencia = json['experiencia'];
    nombreArtistico = json['nombreArtistico'];
    precioChat = json['precioChat'];
    if (json['especialidades'] != null) {
      especialidades = <Especialidades>[];
      json['especialidades'].forEach((v) {
        especialidades!.add(Especialidades.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['sobre'] = this.sobre;
    data['experiencia'] = this.experiencia;
    data['nombreArtistico'] = this.nombreArtistico;
    data['precioChat'] = this.precioChat;
    if (this.especialidades != null) {
      data['especialidades'] =
          this.especialidades!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? email;
  String? firstName;
  String? lastName;
  String? imagen;
  bool ? online;

  User({this.email, this.firstName, this.lastName, this.imagen, this.online});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    imagen = json['imagen'];
    online = json['online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['imagen'] = this.imagen;
    data['online'] = this.online;
    return data;
  }
}

class Especialidades {
  String? nombre;

  Especialidades({this.nombre});

  Especialidades.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    return data;
  }
}