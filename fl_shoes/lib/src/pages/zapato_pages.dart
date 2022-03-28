import 'package:flutter/material.dart';
import 'package:fl_shoes/src/widgets/widgets.dart';

class ZapatoScreen extends StatelessWidget {
   
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(texto: 'For you',),
          const SizedBox(height: 10,),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column( 
                children: [
                  ZapatoSizePreview(),

                  const ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  const ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  )
                ],
              ),
            )
          ),
          const AgregarCarritoBoton(monto:180.0)
        ],
      ),
    );
  }
}