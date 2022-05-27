import 'dart:convert';
import 'package:bcp_crecer/models/empresas.dart';
import 'package:bcp_crecer/models/login.dart';
import 'package:http/http.dart' as http;
import '../models/categorias.dart';
import '../models/register.dart';

Future<LoginResponse> login(LoginRequest request) async {
  var res = await http.post(
      Uri.parse('https://apibcpcrecer.azurewebsites.net/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': request.username!,
        'password': request.password!
      }));
  if (res.statusCode == 200) {
    var resjson = jsonDecode(res.body);
    var rest = LoginResponse.fromJson(resjson);
    return rest;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<LoginResponse> registerAPI(RegisterRequest request) async {
  var res = await http.post(
      Uri.parse('https://apibcpcrecer.azurewebsites.net/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': request.username!,
        'password': request.password!
      }));
  if (res.statusCode == 200) {
    var resjson = jsonDecode(res.body);
    var rest = LoginResponse.fromJson(resjson);
    return rest;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<CategoriasModel> getCategories() async {
  final response = await http
      .get(Uri.parse('https://apibcpcrecer.azurewebsites.net/categorias'));
  if (response.statusCode == 200) {
    var resjson = jsonDecode(response.body);
    var res = CategoriasModel.fromJson(resjson);
    return res;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<EmpresasModel> getEmpresas(int categoriaId) async {
  var res = await http.post(
      Uri.parse('https://apibcpcrecer.azurewebsites.net/empresas'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{'categoriaId': categoriaId}));
  if (res.statusCode == 200) {
    var resjson = jsonDecode(res.body);
    var rest = EmpresasModel.fromJson(resjson);
    return rest;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<ProductosModel> getProductos(int empresaId) async {
  var res = await http.post(
      Uri.parse('https://apibcpcrecer.azurewebsites.net/productos'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{'empresaId': empresaId}));
  if (res.statusCode == 200) {
    var resjson = jsonDecode(res.body);
    var rest = ProductosModel.fromJson(resjson);
    return rest;
  } else {
    throw Exception('Failed to load album');
  }
}
