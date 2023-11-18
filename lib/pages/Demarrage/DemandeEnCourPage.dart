import 'package:flutter/material.dart';

import '../../configuration/configurationCouleur.dart';

class DemandeEnCour extends StatefulWidget {
  const DemandeEnCour({Key? key}) : super(key: key);

  @override
  State<DemandeEnCour> createState() => _DemandeEnCourState();
}

class _DemandeEnCourState extends State<DemandeEnCour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: (BackButton()),),
      body: Center(
        child: Column(
          children: [
            Container(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child:SizedBox(
                      child: Image.asset("asset/images/mesdemandes.jpg",fit: BoxFit.fitWidth,)),)
            ),
            SizedBox(height: 20,),
            FittedBox(child: Text("Mes demandes en Cours", style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30, color: MesCouleur().couleurPrincipal),),),
          ],
        ),
      ),
    );
  }
}
