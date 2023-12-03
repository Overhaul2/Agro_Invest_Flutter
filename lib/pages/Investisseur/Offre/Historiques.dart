import 'package:agro_invest/Provider/AgriculteurPovider.dart';
import 'package:agro_invest/model/AjouterOffremodel.dart';
import 'package:agro_invest/pages/Agriculteur/Demandes/RchercheCredit.dart';
import 'package:agro_invest/service/investisseurService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/InvestisseurProvider.dart';
import '../../../configuration/configurationCouleur.dart';
import '../../../model/AjouterCreditmodel.dart';
import 'OffreDetailles.dart';
import 'ProjetDetailles.dart';

class HistoriquesOffres extends StatefulWidget {
  const HistoriquesOffres({Key? key}) : super(key: key);

  @override
  State<HistoriquesOffres> createState() => _HistoriquesOffresState();
}

class _HistoriquesOffresState extends State<HistoriquesOffres> {

 // AgriculteurService agriculteurService = AgriculteurService();
  @override
  Widget build(BuildContext context) {
    final investisseurServices = InvestisseurService();
    final idInv = Provider.of<InvestisseurProvider>(context, listen: false).investisseur!.idInv;

    return Scaffold(
      appBar: AppBar(
        leading: (BackButton()),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RechercheCredit()));
          },
              icon: Icon(Icons.search_outlined))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                      child: Image.asset(
                    "asset/images/mesdemandes.jpg",
                    fit: BoxFit.fitWidth,
                  )),
                )),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Text(
                "Mes historiques d'Investissement",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: MesCouleur().couleurPrincipal),
              ),
            ),
            FutureBuilder(
              future: investisseurServices.OffreInvestisseur(idInv!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erreur: ${snapshot.error}');
                } else {
                  List<Offre> offres = snapshot.data!;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: (offres==null)?0:offres.length,
                      itemBuilder: (context, index) {
                        Offre offre = offres[index];
                       // print(credits[index]);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OffreDetail(offre: offre)));
                                },
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: offre.offreInvestisseur?.image != null
                                        ? NetworkImage("${offre.offreInvestisseur?.image}") as ImageProvider<Object>?
                                        : AssetImage("asset/images/logo.png") as ImageProvider<Object>?,
                                    radius: 40,
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(child: Text(" ${offre.titre} ")),
                                        FittedBox(child: Text("Montant : ${offre.montant} Fcfa ")),
                                        FittedBox(child: Text("Durrée ${offre.durre} mois ")),

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
