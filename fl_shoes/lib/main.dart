import 'package:fl_shoes/src/models/zapato_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_shoes/src/pages/pages.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ZapatoModel() ),
      ],
      child: MyApp()
    )
  );
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      home: ZapatoScreen()
    );
  }
}