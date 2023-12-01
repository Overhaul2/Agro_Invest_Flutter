import 'package:agro_invest/model/AgriculteurModele.dart';
import 'package:flutter/material.dart';

import '../../../service/agriculteurService.dart';

class AgriculteurAProximite extends StatefulWidget {
  const AgriculteurAProximite({Key? key}) : super(key: key);

  @override
  State<AgriculteurAProximite> createState() => _AgriculteurAProximiteState();
}

class _AgriculteurAProximiteState extends State<AgriculteurAProximite> {
  AgriculteurService agriculteurService = AgriculteurService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (BackButton()),
        title: Center(child: Text("Agriculteur A Proximite")),
      ),
      body: Center(
        child: FutureBuilder(
          future: agriculteurService.affichertoutAgriculteur(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erreur: ${snapshot.error}');
            } else {
              List<Agriculteur> agriculteurs = snapshot.data!;
              return Expanded(
                child: ListView.builder(
                  itemCount: (agriculteurs==null)?0:agriculteurs.length,
                  itemBuilder: (context, index) {
                    Agriculteur agriculteur = agriculteurs[index];
                    // print(credits[index]);
                    return Card(
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 10,
                      //  color: Color(0xB26DC76D),
                      child: ListTile(
                          onTap: () {
                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjetsDetail(credit: credit)));
                          },
                          title: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: agriculteur.image!= null
                                    ? NetworkImage("${agriculteur.image}") as ImageProvider<Object>?
                                    : AssetImage("asset/images/logo.png") as ImageProvider<Object>?,
                                radius: 40,
                              ),
                              SizedBox(width: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(child: Text(" ${agriculteur.nomPrenom} ",style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 20),)),
                                    /*FittedBox(child: Row(
                                      children: [
                                        Text("Montant : ",style: TextStyle(fontWeight: FontWeight.bold)),
                                        Text("${credit.montant} Fcfa "),
                                      ],
                                    )),
                                    FittedBox(child: Row(
                                      children: [
                                        Text("Durrée : ",style: TextStyle(fontWeight: FontWeight.bold)),
                                        Text("${credit.durre} mois"),
                                      ],
                                    )),*/

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
      ),
    );
  }
}
