
import 'package:agro_invest/configuration/configurationCouleur.dart';
import 'package:agro_invest/pages/Agriculteur/Accueil.dart';
import 'package:agro_invest/pages/Demarrage/SplashScren.dart';
import 'package:agro_invest/pages/MotDePasse/CompteCreerEnAttente2.dart';
import 'package:agro_invest/pages/MotDePasse/CompteCreerEnattente.dart';
import 'package:agro_invest/pages/login.dart';
import 'package:agro_invest/pages/test.dart';
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
      title: "",
      theme: ThemeData(
        splashColor: MesCouleur().couleurPrincipal,
        primarySwatch: Colors.green,

      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context)=>LoginAgriculteur(),
      },
      //home:
            //  SplashScreen(),
              //Accueil()
              //CompteCreerEnAttente2(),
              //Accueil(),


    );
  }
}

