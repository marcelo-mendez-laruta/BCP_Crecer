class CategoriasModel {
  List<Categoria>? categorias;

  CategoriasModel({this.categorias});

  CategoriasModel.fromJson(Map<String, dynamic> json) {
    if (json['categorias'] != null) {
      categorias = <Categoria>[];
      json['categorias'].forEach((v) {
        categorias!.add(Categoria.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categorias != null) {
      data['categorias'] = categorias!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categoria {
  int? categoriaId;
  String? nombre;
  String? color;
  String? imagen;

  Categoria({this.categoriaId, this.nombre, this.color, this.imagen});

  Categoria.fromJson(Map<String, dynamic> json) {
    categoriaId = json['categoriaId'];
    nombre = json['nombre'];
    color = json['color'];
    imagen = json['imagen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoriaId'] = categoriaId;
    data['nombre'] = nombre;
    data['color'] = color;
    data['imagen'] = imagen;
    return data;
  }
}
