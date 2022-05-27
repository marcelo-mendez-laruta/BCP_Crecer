import 'package:bcp_crecer/helpers/crecervariables.dart';
import 'package:bcp_crecer/models/login.dart';
import 'package:bcp_crecer/services/apiservices.dart';
import 'package:bcp_crecer/views/categorias.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final LoginResponse profileData;

  const Profile({Key? key, required this.profileData}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        getImagenBase64(widget.profileData.imagen),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.black45, Colors.transparent],
                  stops: [0.5, 0.82, 0.9])),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 140, 25, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '${widget.profileData.nombre} ${widget.profileData.paterno} ${widget.profileData.materno}',
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                '${widget.profileData.idc} ${widget.profileData.extidc}',
                style: TextStyle(
                    fontSize: 18,
                    color: secondaryColor(),
                    fontWeight: FontWeight.w800),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: FractionallySizedBox(
            heightFactor: 1,
            child: profileCard(widget.profileData, context),
          ),
        ),
      ],
    ));
  }
}

Widget getImagenBase64(String? imagen) {
  if (imagen == null) {
    return Image.asset('assets/images/profile.png');
  } else {
    return Image.network(
      imagen,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}

Widget profileCard(LoginResponse profile, BuildContext context) {
  return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bienvenido",
                style: TextStyle(
                    color: primaryColor(),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Recuerda visitar nuestro catalogo de ofertas con muchas alternativas que se adaptan a tus requerimientos y lo mejor de todo con muchos descuentos.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 150),
              Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: GestureDetector(
                      onTap: () => {
                            getCategories().then((value) => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Categorias(categorias: value)),
                                  )
                                })
                          },
                      child: offersCard())),
            ]),
      ));
}

Widget textDescription(String description, String value) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      description,
      style: TextStyle(
          fontSize: 18, color: secondaryColor(), fontWeight: FontWeight.w800),
    ),
    const SizedBox(height: 5),
    Text(value)
  ]);
}

Widget offersCard() {
  return Card(
    child: Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/offersCard.jpg'))),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "Ingresar a mis ofertas",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
              )
            ]),
      ),
    ),
    margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
  );
}
