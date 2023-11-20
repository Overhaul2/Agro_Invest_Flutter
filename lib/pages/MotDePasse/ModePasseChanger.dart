import 'package:agro_invest/pages/Agriculteur/Accueil.dart';
import 'package:flutter/material.dart';

class MotDePasseChanger extends StatefulWidget {
  const MotDePasseChanger({Key? key}) : super(key: key);

  @override
  State<MotDePasseChanger> createState() => _MotDePasseChangerState();
}

class _MotDePasseChangerState extends State<MotDePasseChanger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("asset/images/blob.png"),
            SizedBox(child: Image.asset("asset/images/Successmark.png"),height: 150,),
            SizedBox(height: 50,),
            Container(
              child: Column(
                children: [
                  FittedBox(
                    child: Text("Mot de passe changé !",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  SizedBox(height: 30,),
                  FittedBox(
                    child: Text("Votre mot de passe à été change avec succès2"),
                  )
                ],
              ),

            ),
            SizedBox(height: 80,),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                      backgroundColor: Color(0xA8008000),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                  onPressed: ()  {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Accueil()));
                  },
                  child: Text("Se connecter",
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Image.asset("asset/images/motdepasseoublier.jpg",height: 250,),
            )
          ],
        ),
      ),
    );
  }
}
