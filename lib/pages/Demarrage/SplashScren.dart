import 'dart:async';

import 'package:agro_invest/pages/Demarrage/Demo1.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> DemoPage1()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("asset/images/blob.png",),
            Container(
              child: Image.asset("asset/images/logo.png",height: 200,),
            ),
            SizedBox(height: 80),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 27),
             //alignment: Alignment.center,
             // child: FittedBox(alignment: Alignment.center,
              child: Text("relier les agriculteurs locaux à des investisseurs pour soutenir l'achat de semences, d'engrais et d'équipements agricoles.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,

              ),),//),
            )
          ],
        ),
      ),
    );
  }
}
