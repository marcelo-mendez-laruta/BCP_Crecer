import 'package:bcp_crecer/components/register.dart';
import 'package:bcp_crecer/models/login.dart';
import 'package:bcp_crecer/views/profile.dart';
import 'package:flutter/material.dart';
import '../helpers/crecervariables.dart';
import '../services/apiservices.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late CrecerVariables _variables;
  bool remember = false;
  bool _isLoading = false;
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  initState() {
    super.initState();
    getVariables().then((s) => setState(() {
          _variables = s;
        }));
  }

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
                child: Text("Bienvenido",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
                child: Text(_variables.mensajeBienvenida,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                          controller: userController,
                          style: TextStyle(color: secondaryColor()),
                          decoration: InputDecoration(
                              hintText: "Usuario",
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(245, 125, 49, 1)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.white,
                              filled: true)),
                      const SizedBox(height: 10),
                      TextField(
                          controller: passwordController,
                          obscureText: true,
                          style: TextStyle(color: secondaryColor()),
                          decoration: InputDecoration(
                              hintText: "Contraseña",
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(245, 125, 49, 1)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.white,
                              filled: true)),
                      const SizedBox(height: 10),
                      Row(children: [
                        Checkbox(
                          value: remember,
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.all<Color>(
                              secondaryColor()),
                          onChanged: (bool? value) {
                            setState(() {
                              remember = value!;
                            });
                          },
                        ),
                        const Text(
                          "Recordar Datos.",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ]),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide.none)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              secondaryColor()),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size.fromHeight(50)),
                        ),
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });
                          LoginRequest request = LoginRequest(
                              username: userController.text,
                              password: passwordController.text);
                          login(request).then((value) => {
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()),
                            );
                          },
                          child: const Text("Registrate"))
                    ]),
              )
            ]),
          ),
        )
      ]),
    );
  }
}
