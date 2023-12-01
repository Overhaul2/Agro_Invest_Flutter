import 'package:agro_invest/pages/Agriculteur/Demandes/RchercheCredit.dart';
import 'package:agro_invest/service/agriculteurService.dart';
import 'package:flutter/material.dart';

import '../../../configuration/configurationCouleur.dart';
import '../../../model/AjouterCreditmodel.dart';
import 'ProjetDetailles.dart';

class ProjetsAgricol extends StatefulWidget {
  const ProjetsAgricol({Key? key}) : super(key: key);

  @override
  State<ProjetsAgricol> createState() => _ProjetsAgricolState();
}

class _ProjetsAgricolState extends State<ProjetsAgricol> {

  AgriculteurService agriculteurService = AgriculteurService();
  @override
  Widget build(BuildContext context) {
    final agriculteurServices = AgriculteurService();
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
              //height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: SizedBox(
                      child: Image.asset(
                        "asset/images/projetAgricoles.jpg",
                        // fit: BoxFit.fitWidth,
                      )),
                )),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: Text(
                "Projets Agricoles",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: MesCouleur().couleurPrincipal),
              ),
            ),
            FutureBuilder(
              future: agriculteurServices.afficherCreditSansInvestisseur(),
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
                        return Card(
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: MesCouleur().couleurPrincipal
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 10,
                         // color: Color(0xB26DC76D),
                          child: ListTile(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjetsDetail(credit: credit)));
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
                                        FittedBox(child: SizedBox(
                                          width: 280,
                                            child: Text(" ${credit.titre} "))),
                                        FittedBox(child: Text("Montant : ${credit.montant} Fcfa ")),
                                        FittedBox(child: Text("Durrée ${credit.durre} mois ")),

                                      ],
                                    ),
                                  )
                                ],
                              )
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