import 'package:fl_shoes/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ZapatosDescPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children:  [
                  const ZapatoSizePreview(fullscreen: true),
                  const ZapatoDescripcion(
                        titulo: 'Nike Air Max 720',
                        descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                      ),
                  _MontoBuyNow(),
                  _ColoresYmas(),
                  _BotonLikeCartSettings()
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

class _BotonLikeCartSettings extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           const _BotonSombreado(Icon(Icons.favorite, size: 25, color: Colors.red,)),
           const _BotonSombreado(Icon(Icons.add_shopping_cart, size: 25, color: Colors.blueGrey,)),
           _BotonSombreado(Icon(Icons.settings, size: 25, color: Colors.green.shade300,)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {

  final Icon icon;

  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10)
          )
        ]
      ),
    );
  }
}

class _ColoresYmas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                const Positioned(left: 90, child: _BotonColor(Colors.orange)),
                const Positioned(left: 60, child: _BotonColor(Color.fromARGB(255, 13, 97, 58))),
                Positioned(left: 30, child: _BotonColor(Colors.green.shade400)),
                _BotonColor(Colors.blue.shade400),
              ],
            ),
          ),
          
          const BotonNaranja(texto: 'More related items', alto: 30, ancho: 170, color: Color(0xffffc675),)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {

  final Color color;

  const _BotonColor(this.color);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: const [
            Text('\$180', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            Spacer(),
            BotonNaranja(texto: 'Buy Now', ancho: 120, alto: 40,)
          ],
        ),
      ),
    );
  }
}