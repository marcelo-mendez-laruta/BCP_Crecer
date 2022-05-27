import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CrecerVariables {
  CrecerVariables({required this.mensajeBienvenida, required this.terminos});
  final String mensajeBienvenida;
  final String terminos;

  factory CrecerVariables.fromJson(Map<String, dynamic> data) {
    final mensajeBienvenida = data['mensajeBienvenida'] as String;
    final terminos = data['terminosCondiciones'] as String;
    return CrecerVariables(
        mensajeBienvenida: mensajeBienvenida, terminos: terminos);
  }
}

Future<CrecerVariables> getVariables() async {
  final data = await rootBundle.loadString('assets/variables.json');
  final jsonResponse = json.decode(data);
  return CrecerVariables.fromJson(jsonResponse);
}

Color primaryColor() {
  return const Color(0xff004B8E);
}

Color secondaryColor() {
  return const Color.fromRGBO(245, 125, 49, 1);
}
