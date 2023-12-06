import 'package:agro_invest/pages/InscriptionInvestisseur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Agriculteur/InscriptionAgriculteur.dart';

class DemoPage2 extends StatefulWidget {
  const DemoPage2({Key? key}) : super(key: key);

  @override
  State<DemoPage2> createState() => _DemoPage1State();
}

class _DemoPage1State extends State<DemoPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 0),
            child: SizedBox(
              child: Image.asset("asset/images/blob.png"),
            )
            ),

            Container(
              child: Image.asset("asset/images/demo2.jpg",height: 250,),
            ),
            SizedBox(height: 20),
            Center(
              child: Text("Continnuons",
                style: TextStyle(
                  color: Color(0xA8008000),
                  fontSize: 40,
                  fontFamily: "Inika",
                  fontWeight: FontWeight.bold,

                ),).animate().slide(delay: 500.ms).slideY(curve: Curves.decelerate),
            ),
            SizedBox(height: 20),
            Center(
              child: Text("Veillez indiquer votre statut",
                style: TextStyle(
 //                 color: Color(0xA8008000),
                  fontSize: 20,
                  fontFamily: "Inika",
                  fontWeight: FontWeight.bold,

                ),).animate().fadeIn(delay: 500.ms).slideY(curve: Curves.easeInCirc),
            ),
            Center(
              child: Text("sur la plateforme",
                style: TextStyle(
 //                 color: Color(0xA8008000),
                  fontSize: 20,
                  fontFamily: "Inika",
                  fontWeight: FontWeight.bold,

                ),).animate().fadeIn(delay: 500.ms).slideY(curve: Curves.bounceInOut),
            ),

            SizedBox(height: 80,),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 65, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Color(0xA8008000)),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InscriptionAgriculteur()));
                },
                child: Text("Je Suis Agriculteur",
                  style: TextStyle(fontSize: 20),),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Color(0xA8008000)),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InscriptionInvestisseur()));
                },
                child: Text("Je suis Investisseur",
                  style: TextStyle(fontSize: 20),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
