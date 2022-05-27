class RegisterRequest {
  String? username;
  String? password;
  String? nombre;
  String? paterno;
  String? materno;
  String? imagen;
  String? fecnac;
  String? idc;
  String? tipoidc;
  String? extidc;
  String? complementoidc;

  RegisterRequest(
      {this.username,
      this.password,
      this.nombre,
      this.paterno,
      this.materno,
      this.imagen,
      this.fecnac,
      this.idc,
      this.tipoidc,
      this.extidc,
      this.complementoidc});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
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
    data['username'] = username;
    data['password'] = password;
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
