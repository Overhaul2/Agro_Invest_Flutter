import 'package:agro_invest/service/investisseurService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AgriculteurPovider.dart';
import '../../../configuration/configurationCouleur.dart';
import '../../../model/AjouterCreditmodel.dart';
import '../../../service/agriculteurService.dart';
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
    InvestisseurService investisseurService = InvestisseurService();
    final idAgr = Provider.of<AgriculteurProvider>(context, listen: false)
        .agriculteur!
        .idAgr;

    return Scaffold(
      appBar: AppBar(
        leading: (BackButton(
          onPressed: () {
            agriculteurServices.demandeAccepter(idAgr!);
            investisseurService.OffreSansAgriculteurs();
            Navigator.of(context).pop();
          },
        )),
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
            SizedBox(height: 20,),
            FittedBox(child: Text("Mes demandes en Cours", style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30, color: MesCouleur().couleurPrincipal),),),

            FutureBuilder(
              future: agriculteurServices.demandeAccepter(idAgr!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.only(top:50),
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return
                    Column(
                      children: [
                        Container(child: Image.asset("asset/images/notfound.jpg"),
                          padding: EdgeInsets.only(top: 50),
                          height: 200,
                        ),
                        Text('Vous n\'avez pas de demande en cour',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), )
                      ],
                    );

                } else {
                  List<Credit> credits = snapshot.data!;
                    if (credits == null || credits.isEmpty) {
                      return Center(
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Image.asset(
                              "asset/images/vide.jpg",
                              height: 200,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Vous n'avez aucune Demande en cour",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ]),
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: credits.length,
                        itemBuilder: (context, index) {
                          Credit credit = credits[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: MesCouleur().couleurPrincipal),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 10,
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreditDetaille(credit: credit)),
                                  );
                                },
                                title: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: credit
                                                  .agriculteur?.image !=
                                              null
                                          ? NetworkImage("http://10.0.2.2/" +
                                                  "${credit.agriculteur?.image}")
                                              as ImageProvider<Object>?
                                          : AssetImage("asset/images/logo.png")
                                              as ImageProvider<Object>?,
                                      radius: 40,
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 260,
                                            child: Text(
                                              " ${credit.titre} ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          FittedBox(
                                              child: Text(
                                                  "Montant : ${credit.montant} Fcfa ")),
                                          FittedBox(
                                              child: Text(
                                                  "Durée ${credit.durre} mois ")),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
