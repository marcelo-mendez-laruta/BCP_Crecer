import 'package:bcp_crecer/models/empresas.dart';
import 'package:flutter/material.dart';
import 'detalleproducto.dart';

class OffersList extends StatefulWidget {
  final List<Producto> productos;
  const OffersList({Key? key, required this.productos}) : super(key: key);

  @override
  State<OffersList> createState() => _OffersListState();
}

class _OffersListState extends State<OffersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(flex: 8, child: creditsListWidget(widget.productos)),
      ]),
    );
  }
}

Widget creditsListWidget(List<Producto>? productos) {
  return ListView.builder(
    itemCount: productos!.length,
    itemBuilder: (context, index) {
      final item = productos[index];
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: GestureDetector(
          child: creditsCard(item),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetalleProducto(producto: item)));
          },
        ),
      );
    },
  );
}

Widget creditsCard(Producto producto) {
  int color = int.parse(producto.color!);
  if (producto.imagen == null) {
    return Card(
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color(color).withOpacity(0.3),
            image: const DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/creditosBG.png'))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: creditsCardContent(producto),
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
                  fit: BoxFit.cover, image: AssetImage(producto.imagen!))),
        ),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color(color).withOpacity(0.4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: creditsCardContent(producto),
          ),
        ),
      ]),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
    );
  }
}

Widget creditsCardContent(Producto producto) {
  double descuento = producto.precio! * (producto.descuento! / 100);
  double newprecio = producto.precio! - descuento;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          producto.nombre!,
          style: const TextStyle(
              color: Colors.white, fontSize: 21, fontWeight: FontWeight.normal),
        ),
        Text(
          "Antes ${producto.precio!} Bs.",
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
        ),
      ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Ahora ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              newprecio.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              " Bs.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold),
            ),
          ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
              child: Text(
                "Descuento de  ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Text(
              producto.descuento.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              " %",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ]),
    ],
  );
}
