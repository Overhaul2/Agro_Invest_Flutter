import 'package:agro_invest/configuration/configurationCouleur.dart';
import 'package:agro_invest/pages/Agriculteur/Accueil.dart';
import 'package:agro_invest/pages/Agriculteur/login.dart';
import 'package:agro_invest/pages/Investisseur/AccueilInvestisseur.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Provider/AgriculteurPovider.dart';
import 'Provider/InvestisseurProvider.dart';


final apikey= "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";

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

class ChatMessage{
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;

  @override
  void initState() {
    super.initState();
    getSharedPreferenceValue();
  }

  void getSharedPreferenceValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      isUserLoggedIn = pref.getBool("isUserLoggedIn") ?? false;
      print("Valeur de isUserLoggedIn dans getSharedPreferenceValue : $isUserLoggedIn");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      theme: ThemeData(
        splashColor: MesCouleur().couleurPrincipal,
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: /*isUserLoggedIn ? Accueil():*/LoginAgriculteur(),
    );
  }
}
