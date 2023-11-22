
import 'package:agro_invest/configuration/configurationCouleur.dart';
import 'package:agro_invest/pages/Agriculteur/Accueil.dart';
import 'package:agro_invest/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Provider/AgriculteurPovider.dart';
import 'Provider/InvestisseurProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AgriculteurProvider()),
        ChangeNotifierProvider(create: (context) => InvestisseurProvider()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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

