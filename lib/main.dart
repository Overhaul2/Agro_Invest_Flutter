
import 'package:agro_invest/configuration/configurationCouleur.dart';
import 'package:agro_invest/pages/MotDePasseOublier.dart';
import 'package:agro_invest/pages/SplashScren.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData(
        splashColor: MesCouleur().couleurPrincipal,
        primarySwatch: Colors.green,

      ),
      debugShowCheckedModeBanner: false,
      home:  MotDePasseOublier(),
              //Accueil(),

    );
  }
}

