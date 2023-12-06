import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AgriculteurPovider.dart';
import '../../../configuration/configurationCouleur.dart';
import '../../../model/AjouterCreditmodel.dart';
import '../../../service/agriculteurService.dart';
import 'CreditDetaillePage.dart';

class DemandeEffectuer extends StatefulWidget {
  const DemandeEffectuer({Key? key}) : super(key: key);

  @override
  State<DemandeEffectuer> createState() => _DemandeEffectuerState();
}

class _DemandeEffectuerState extends State<DemandeEffectuer> {
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
                  return Padding(
                    padding: const EdgeInsets.only(top:50),
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return
                    Column(
                      children: [
                        Container(child: Image.asset("asset/images/notfoundo.jpg"),
                          padding: EdgeInsets.only(top: 50),
                          height: 200,
                        ),
                        Text('Une erreur s\'est produite lors de la recupération des donné',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), )
                      ],
                    );

                } else {
                  List<Credit> credits = snapshot.data!;
                  if (credits == null || credits.isEmpty) {
                    return Center(
                      child: Column(children: [
                        Padding(padding: EdgeInsets.only(top: 40),
                          child: Image.asset("asset/images/vide.jpg",height: 200,),
                        ),SizedBox(height: 40,),
                        Text("Vous n'avez aucune Investissement en cour",style: TextStyle(fontWeight: FontWeight.bold),)
                      ]),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: (credits == null) ? 0 : credits.length,
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
                                          SizedBox(
                                              child: Text(" ${credit.titre} ")),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          FittedBox(
                                              child: Text(
                                            "Montant : ${credit.montant} Fcfa ",
                                          )),
                                          FittedBox(
                                              child: Text(
                                                  "Durrée ${credit.durre} mois ")),
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
