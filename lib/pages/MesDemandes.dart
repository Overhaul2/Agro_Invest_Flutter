import 'package:agro_invest/configuration/configurationCouleur.dart';
import 'package:agro_invest/pages/Agriculteur/AjouterCredit.dart';
import 'package:agro_invest/pages/Demarrage/DemandeEnCourPage.dart';
import 'package:agro_invest/pages/HistoriqueDemande.dart';
import 'package:flutter/material.dart';

import 'MotDePasse/NouveauMotdePasseOublier.dart';

class MesDemndes extends StatefulWidget {
  const MesDemndes({Key? key}) : super(key: key);

  @override
  State<MesDemndes> createState() => _MesDemndesState();
}

class _MesDemndesState extends State<MesDemndes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (BackButton()),
      ),
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
            FittedBox(child: Text("Mes Demandes", style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 30, color: MesCouleur().couleurPrincipal),),),
            SizedBox(height: 60,),

            Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: MesCouleur().couleurPrincipal)
              ),
              elevation: 10,
              shadowColor: MesCouleur().couleurPrincipal,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DemandeEnCour()));
                },
                child:  SizedBox(
                  width: 300,
                  height: 70,
                  child: Center(
                    child: Text('Demandes En Cour',style: TextStyle(
                      fontSize: 30,fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              ),
            ),Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: MesCouleur().couleurPrincipal)
              ),
              elevation: 10,
              shadowColor: MesCouleur().couleurPrincipal,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HistoriqueDemande()));
                },
                child:  SizedBox(
                  width: 300,
                  height: 70,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Historiques',style: TextStyle(
                          fontSize: 30,fontWeight: FontWeight.bold,
                        ),),
                      )
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    backgroundColor: Color(0xA8008000),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: ()  {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FaireUneDemane()));
                },
                child: Text("Faire une Demande",
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
