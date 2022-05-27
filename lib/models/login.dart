class LoginRequest {
  String? username;
  String? password;

  LoginRequest({this.username, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    username = json['usuario'];
    password = json['contrasena'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['usuario'] = username;
    data['contrasena'] = password;
    return data;
  }
}

class LoginResponse {
  String? nombre;
  String? paterno;
  String? materno;
  String? imagen;
  String? fecnac;
  String? idc;
  String? tipoidc;
  String? extidc;
  String? complementoidc;

  LoginResponse({
    this.nombre,
    this.paterno,
    this.materno,
    this.imagen,
    this.fecnac,
    this.idc,
    this.tipoidc,
    this.extidc,
    this.complementoidc,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    paterno = json['paterno'];
    materno = json['materno'];
    imagen = json['imagen'];
    fecnac = json['fecnac'];
    idc = json['idc'];
    tipoidc = json['tipoidc'];
    extidc = json['extidc'];
    complementoidc = json['complementoidc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nombre'] = nombre;
    data['paterno'] = paterno;
    data['materno'] = materno;
    data['imagen'] = imagen;
    data['fecnac'] = fecnac;
    data['idc'] = idc;
    data['tipoidc'] = tipoidc;
    data['extidc'] = extidc;
    data['complementoidc'] = complementoidc;
    return data;
  }
}
