import 'package:flutter/material.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      'assets/images/splashBG.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    ));
  }
}

_navigateToHome(BuildContext context) async {
  await Future.delayed(
      const Duration(milliseconds: 3000),
      () => {
            //Validar si tiene login y pasar directo a perfil
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Login()))
          });
}
