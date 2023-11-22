import 'package:flutter/material.dart';

import '../../../configuration/configurationCouleur.dart';


class HistoriqueDemande extends StatefulWidget {
  const HistoriqueDemande({Key? key}) : super(key: key);

  @override
  State<HistoriqueDemande> createState() => _HistoriqueDemandeState();
}

class _HistoriqueDemandeState extends State<HistoriqueDemande> {
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
            SizedBox(height: 20,),
            FittedBox(child: Text("Mes historiques de demande", style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30, color: MesCouleur().couleurPrincipal),),),
          ],
        ),
      ),
    );
  }
}
