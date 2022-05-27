import 'package:bcp_crecer/models/empresas.dart';
import 'package:flutter/material.dart';

import '../helpers/crecervariables.dart';

class DetalleProducto extends StatefulWidget {
  final Producto producto;
  const DetalleProducto({Key? key, required this.producto}) : super(key: key);

  @override
  State<DetalleProducto> createState() => _DetalleProductoState();
}

class _DetalleProductoState extends State<DetalleProducto> {
  @override
  Widget build(BuildContext context) {
    double descuento =
        widget.producto.precio! * (widget.producto.descuento! / 100);
    double newprecio = widget.producto.precio! - descuento;
    return Scaffold(
        body: Stack(
      children: [
        getCreditImage(widget.producto),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(children: [
            Text(
              widget.producto.nombre!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const Text(
              "a Solo",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(newprecio.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                  const Text(" Bs.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold))
                ])
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: FractionallySizedBox(
            heightFactor: 1,
            child: profileCard(widget.producto, newprecio, context),
          ),
        ),
      ],
    ));
  }
}

Widget getCreditImage(Producto producto) {
  int color = int.parse(producto.color!);
  if (producto.imagen == null) {
    return Image.asset('images/creditosBG.png');
  } else {
    return Stack(children: [
      Image.asset(
        producto.imagen!,
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
      Container(
        height: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color(color).withOpacity(0.4)),
      ),
    ]);
  }
}

Widget profileCard(Producto producto, double precio, BuildContext context) {
  return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 15,
            offset: Offset(0, -2), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                textDescription('Descripción', '${producto.descripcion}'),
                const SizedBox(height: 10),
                textDescription('Precio', '${producto.precio} Bs.'),
                const SizedBox(height: 10),
                textDescription('Descuento', '${producto.descuento}'),
                const SizedBox(height: 10),
                textDescription('Precio Soli', '$precio Bs.'),
              ]),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
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
                  onPressed: () {},
                  child: const Text('Pagar',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              )
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
