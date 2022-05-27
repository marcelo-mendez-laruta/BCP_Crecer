import 'package:bcp_crecer/views/offerslist.dart';
import 'package:flutter/material.dart';

import '../models/empresas.dart';
import '../services/apiservices.dart';

class Empresas extends StatefulWidget {
  final EmpresasModel empresas;
  const Empresas({Key? key, required this.empresas}) : super(key: key);

  @override
  State<Empresas> createState() => _EmpresasState();
}

class _EmpresasState extends State<Empresas> {
  @override
  Widget build(BuildContext context) {
    List<Empresa> empresas = widget.empresas.empresas!;
    return Scaffold(
      body: ListView.builder(
        itemCount: empresas.length,
        itemBuilder: (context, index) {
          final item = empresas[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: GestureDetector(
              child: creditsCard(item),
              onTap: () {
                getProductos(item.empresaId!).then((value) => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OffersList(productos: value.productos!)),
                      )
                    });
              },
            ),
          );
        },
      ),
    );
  }
}

Widget creditsCard(Empresa empresa) {
  int color = int.parse(empresa.color!);
  if (empresa.imagen == null) {
    return Card(
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: const DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/creditosBG.png'))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: creditsCardContent(empresa),
        ),
      ),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
    );
  } else {
    return Card(
      child: Stack(children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(empresa.imagen!))),
        ),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Color(color).withOpacity(0.3)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: creditsCardContent(empresa),
          ),
        ),
      ]),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
    );
  }
}

Widget creditsCardContent(Empresa empresa) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(children: [
        Text(
          empresa.nombre!,
          style: const TextStyle(
              color: Colors.white, fontSize: 31, fontWeight: FontWeight.bold),
        ),
      ]),
    ],
  );
}
