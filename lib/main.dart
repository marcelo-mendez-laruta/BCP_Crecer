import 'package:bcp_crecer/helpers/crecervariables.dart';
import 'package:bcp_crecer/views/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BCP Crecer',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: primaryColor(),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Color.fromRGBO(245, 125, 49, 1)),
            hintStyle: TextStyle(color: Color(0xff004B8E)),
          )),
      home: const Splash(),
    );
  }
}
