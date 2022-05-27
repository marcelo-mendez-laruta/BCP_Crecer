import 'package:flutter/material.dart';
import '../models/categorias.dart';
import '../services/apiservices.dart';
import 'empresas.dart';

class Categorias extends StatefulWidget {
  final CategoriasModel categorias;
  const Categorias({Key? key, required this.categorias}) : super(key: key);

  @override
  State<Categorias> createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  @override
  Widget build(BuildContext context) {
    List<Categoria>? categorias = widget.categorias.categorias;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Categorias",
              style: TextStyle(
                  color: Color(0xff004B8E),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: categorias?.length,
            itemBuilder: (ctx, i) {
              return categoriaCard(categorias![i], context);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 5,
              mainAxisExtent: 164,
            ),
          )
        ],
      ),
    ));
  }
}

Widget getImagenBase64(String? imagen) {
  if (imagen == null) {
    return Image.asset('assets/images/profile.png');
  } else {
    return Image.network(
      imagen,
      fit: BoxFit.fitWidth,
    );
  }
}

Widget categoriaCard(Categoria categoria, BuildContext context) {
  int color = int.parse(categoria.color!);
  return GestureDetector(
    onTap: () {
      getEmpresas(categoria.categoriaId!).then((value) => {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Empresas(empresas: value)),
            )
          });
    },
    child: Card(
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(categoria.imagen!))),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Color(color).withOpacity(0.3)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    categoria.nombre!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  )
                ]),
          ),
        ),
      ]),
      margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
    ),
  );
}
