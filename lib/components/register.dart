import 'package:bcp_crecer/views/login.dart';
import 'package:flutter/material.dart';

import '../helpers/crecervariables.dart';
import '../models/register.dart';
import '../services/apiservices.dart';
import '../views/profile.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final nombreController = TextEditingController();
  final paternoController = TextEditingController();
  final maternoController = TextEditingController();
  final imagenController = TextEditingController();
  final fecnacController = TextEditingController();
  final idcController = TextEditingController();
  final extidcController = TextEditingController();
  final complementoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 2,
            child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Image.asset('assets/images/logoBCP.png'),
                ))),
        Expanded(
          flex: 8,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 15,
                  offset: Offset(0, -2), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Color(0xff004B8E),
            ),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 41, 0, 0),
                child: Text("Registrate",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
                child: Text("por favor llena los siguientes campos.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(children: [
                  bcpInput(userController, "Usuario", false),
                  bcpInput(passwordController, "Contraseña", true),
                  bcpInput(nombreController, "Nombre", false),
                  bcpInput(paternoController, "Apellido Paterno", false),
                  bcpInput(maternoController, "Apellido Materno", false),
                  bcpInput(imagenController, "Fotografia(Url)", false),
                  bcpInput(fecnacController, "Fecha de Nacimiento (dd/mm/aaaa)",
                      false),
                  bcpInput(idcController, "CI", false),
                  bcpInput(extidcController, "Extension (Ej. LP)", false),
                  bcpInput(
                      complementoController, "Complemento (Ej. 00)", false),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide.none)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(secondaryColor()),
                      minimumSize: MaterialStateProperty.all<Size>(
                          const Size.fromHeight(50)),
                    ),
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      RegisterRequest request = RegisterRequest(
                          username: userController.text,
                          password: passwordController.text,
                          nombre: nombreController.text,
                          paterno: paternoController.text,
                          materno: maternoController.text,
                          imagen: imagenController.text,
                          fecnac: fecnacController.text,
                          idc: idcController.text,
                          tipoidc: "Q",
                          extidc: extidcController.text,
                          complementoidc: complementoController.text);
                      registerAPI(request).then((value) => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Profile(profileData: value)),
                            )
                          });
                    },
                    icon: _isLoading
                        ? const CircularProgressIndicator()
                        : const Icon(
                            Icons.login,
                          ),
                    label: Text(_isLoading ? "CARGANDO" : 'INGRESAR',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Text("Ya tienes cuenta?"))
                ]),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}

Widget bcpInput(controller, hint, obscure) {
  return TextField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(color: secondaryColor()),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(245, 125, 49, 1)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.white,
          filled: true));
}
