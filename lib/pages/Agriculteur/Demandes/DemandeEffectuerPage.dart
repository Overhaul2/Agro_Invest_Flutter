import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AgriculteurPovider.dart';
import '../../../configuration/configurationCouleur.dart';
import '../../../model/AjouterCreditmodel.dart';
import '../../../service/agriculteurService.dart';
import 'CreditDetaillePage.dart';

class DemandeEffectuerPage extends StatefulWidget {
  const DemandeEffectuerPage({Key? key}) : super(key: key);

  @override
  State<DemandeEffectuerPage> createState() => _DemandeEffectuerPageState();
}

class _DemandeEffectuerPageState extends State<DemandeEffectuerPage> {
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
            FittedBox(child: Text("Mes demandes de Credit", style: TextStyle(fontWeight: FontWeight.bold,
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
                        Container(child: Image.asset("asset/images/vide.jpg"),
                          padding: EdgeInsets.only(top: 50),
                          height: 200,
                        ),
                        Center(child: Text('Vous n\'avez effectuer aucune demande',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold), ))
                      ],
                    );

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
                                          ? NetworkImage("http://10.0.2.2/"+"${credit.agriculteur?.image}") as ImageProvider<Object>?
                                          : AssetImage("asset/images/logo.png") as ImageProvider<Object>?,
                                      radius: 40,
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 240,
                                            child: Text(
                                              " ${credit.titre} ",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis, // Ajoutez cette ligne
                                            ),
                                          ),
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
