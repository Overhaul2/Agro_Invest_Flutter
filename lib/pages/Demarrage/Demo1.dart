import 'package:agro_invest/pages/Demarrage/Demo2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Agriculteur/login.dart';

class DemoPage1 extends StatefulWidget {
  const DemoPage1({Key? key}) : super(key: key);

  @override
  State<DemoPage1> createState() => _DemoPage1State();
}

class _DemoPage1State extends State<DemoPage1> {
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
            SizedBox(height: 60),
            Text("Bienvenue sur",
              style: TextStyle(
                color: Color(0xA8008000),
                fontSize: 40,
                fontFamily: "Inika",
                fontWeight: FontWeight.bold,

              ),).animate().fadeIn(delay: 500.ms).slideY(curve: Curves.bounceInOut),
            Text("AGRO INVEST",
              style: TextStyle(
                color: Color(0xA8008000),
                fontSize: 40,
                fontFamily: "Inika",
                fontWeight: FontWeight.bold,
              ),).animate().fadeIn(delay: 500.ms).slideY(curve: Curves.bounceInOut),
            SizedBox(height: 60,),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 85, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                backgroundColor: Color(0xA8008000)),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginAgriculteur()));
                },
                child: Text("J'ai un compte",
                style: TextStyle(fontSize: 20),),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 78, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                backgroundColor: Color(0xA8008000)),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DemoPage2()));
                },
                child: Text("Je suis nouveau",
                style: TextStyle(fontSize: 20),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
