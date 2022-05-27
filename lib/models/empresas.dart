class EmpresasModel {
  List<Empresa>? empresas;

  EmpresasModel({this.empresas});

  EmpresasModel.fromJson(Map<String, dynamic> json) {
    if (json['empresas'] != null) {
      empresas = <Empresa>[];
      json['empresas'].forEach((v) {
        empresas!.add(Empresa.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (empresas != null) {
      data['empresas'] = empresas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Empresa {
  int? empresaId;
  String? nombre;
  String? imagen;
  String? color;
  int? categoriaId;

  Empresa(
      {this.empresaId, this.nombre, this.imagen, this.color, this.categoriaId});

  Empresa.fromJson(Map<String, dynamic> json) {
    empresaId = json['empresaId'];
    nombre = json['nombre'];
    imagen = json['imagen'];
    color = json['color'];
    categoriaId = json['categoriaId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nombre'] = nombre;
    data['imagen'] = imagen;
    data['color'] = color;
    data['categoriaId'] = categoriaId;
    return data;
  }
}

class ProductosModel {
  List<Producto>? productos;

  ProductosModel({this.productos});

  ProductosModel.fromJson(Map<String, dynamic> json) {
    if (json['productos'] != null) {
      productos = <Producto>[];
      json['productos'].forEach((v) {
        productos!.add(Producto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productos != null) {
      data['productos'] = productos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Producto {
  int? productoId;
  String? nombre;
  String? imagen;
  String? color;
  double? precio;
  double? descuento;
  String? descripcion;
  int? empresaId;

  Producto(
      {this.productoId,
      this.nombre,
      this.imagen,
      this.color,
      this.precio,
      this.descuento,
      this.descripcion,
      this.empresaId});

  Producto.fromJson(Map<String, dynamic> json) {
    productoId = json['productoId'];
    nombre = json['nombre'];
    imagen = json['imagen'];
    color = json['color'];
    precio = json['precio'];
    descuento = json['descuento'];
    descripcion = json['descripcion'];
    empresaId = json['empresaId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productoId'] = productoId;
    data['nombre'] = nombre;
    data['imagen'] = imagen;
    data['color'] = color;
    data['precio'] = precio;
    data['descuento'] = descuento;
    data['descripcion'] = descripcion;
    data['empresaId'] = empresaId;
    return data;
  }
}
