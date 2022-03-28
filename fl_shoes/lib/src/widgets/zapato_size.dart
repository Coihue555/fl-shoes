import 'package:flutter/material.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullscreen;

  const ZapatoSizePreview({this.fullscreen = false});
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullscreen) ? 5 : 30, 
          vertical: (fullscreen) ? 5 : 0
        ),
        child: Container(
          width: double.infinity,
          height: (fullscreen) ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffffcf53),
            borderRadius:
                    (!fullscreen)
                    ? BorderRadius.circular(50)
                    : const BorderRadius.only(bottomLeft: Radius.circular(50),
                                        bottomRight: Radius.circular(50),
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40),)
          ),
          child: Column(
            children: [
              _ZapatoConSombra(),

              if(!fullscreen)
                _ZapatoTalla()
            ],
          ),
        ),
      ),
    );
  }
}


class _ZapatoTalla extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(9.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(6.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {

  final double numero;
  
  const _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(numero.toString().replaceAll('.0', ''), 
        style: TextStyle(
          color: (numero==9) ? Colors.white : Color(0xfff1a23a) ,
          fontSize: 16,
          fontWeight: FontWeight.bold

        )
      ),
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: (numero==9) ? Color(0xfff1a23a) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if(numero==9)
          const BoxShadow(
            color: Color(0xfff1a23a),
            blurRadius: 10,
            offset: Offset(0, 5)
          )
        ]
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [

          Positioned(
            bottom: 10,
            left: 20,
            child: _ZapatoSombra()
          ),

          Image(image: AssetImage('assets/imgs/azul.png')
        )
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color.fromARGB(255, 184, 127, 62), blurRadius: 40)
          ]
        ),
      ),
    );
  }
}