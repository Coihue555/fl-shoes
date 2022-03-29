import 'package:fl_shoes/src/helpers/helpers.dart';
import 'package:fl_shoes/src/models/zapato_model.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:fl_shoes/src/widgets/widgets.dart';
import 'package:provider/provider.dart';


class ZapatosDescPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children:  [
                  Stack(
                    children: [
                      const Hero(
                        tag:'zapato-1',
                        child: ZapatoSizePreview(fullscreen: true)
                      ),

                      Positioned(
                        top: 80,
                        child: FloatingActionButton(
                          child: const Icon(Icons.chevron_left, color: Colors.white, size: 60,),
                          elevation: 0,
                          highlightElevation: 0,
                          backgroundColor: Colors.transparent,
                          onPressed: (){
                            Navigator.pop(context);
                          },

                        ),
                        )
                      ]
                    ),
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
              children: const [
                Positioned(left: 90, child: _BotonColor(Colors.black, 4, 'assets/imgs/negro.png')),
                Positioned(left: 60, child: _BotonColor(Colors.yellow, 3, 'assets/imgs/amarillo.png')),
                Positioned(left: 30, child: _BotonColor(Colors.blue, 2, 'assets/imgs/azul.png')),
                _BotonColor(Colors.green, 1, 'assets/imgs/verde.png'),
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
  final int index;
  final String urlImagen;

  const _BotonColor(this.color, this.index, this.urlImagen);


  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index*100),
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
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
          children: [
            const Text('\$180', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child: const BotonNaranja(texto: 'Buy Now', ancho: 120, alto: 40,))
          ],
        ),
      ),
    );
  }
}