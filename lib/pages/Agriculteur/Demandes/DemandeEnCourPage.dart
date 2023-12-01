import 'package:agro_invest/pages/Agriculteur/Demandes/HistoriqueCreditDetaillePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AgriculteurPovider.dart';
import '../../../configuration/configurationCouleur.dart';
import '../../../model/AjouterCreditmodel.dart';
import '../../../service/agriculteurService.dart';
import '../../Investisseur/Offre/OffreEffectuerDetaillePage.dart';
import 'CreditDetaillePage.dart';

class DemandeEnCour extends StatefulWidget {
  const DemandeEnCour({Key? key}) : super(key: key);

  @override
  State<DemandeEnCour> createState() => _DemandeEnCourState();
}

class _DemandeEnCourState extends State<DemandeEnCour> {
  @override
  Widget build(BuildContext context) {

    final agriculteurServices = AgriculteurService();
    final idAgr = Provider.of<AgriculteurProvider>(context, listen: false).agriculteur!.idAgr;

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

            FutureBuilder(
              future: agriculteurServices.CreditAgriculteur(idAgr!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erreur: ${snapshot.error}');
                } else {
                  List<Credit> credits = snapshot.data!;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: (credits==null)?0:credits.length,
                      itemBuilder: (context, index) {
                        Credit credit = credits[index];
                        // print(credits[index]);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: MesCouleur().couleurPrincipal),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 10,
                            // color: Color(0xB26DC76D),
                            child: ListTile(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreditDetaille(credit: credit)));
                                },
                                title: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: credit.agriculteur?.image != null
                                          ? NetworkImage("${credit.agriculteur?.image}") as ImageProvider<Object>?
                                          : AssetImage("asset/images/logo.png") as ImageProvider<Object>?,
                                      radius: 40,
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(child: Text(" ${credit.titre} ")),
                                          SizedBox(height: 20,),
                                          FittedBox(child: Text("Montant : ${credit.montant} Fcfa ")),
                                          FittedBox(child: Text("Durrée ${credit.durre} mois ")),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
