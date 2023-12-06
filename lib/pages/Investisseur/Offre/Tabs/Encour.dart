
import 'package:agro_invest/Provider/InvestisseurProvider.dart';
import 'package:agro_invest/model/AjouterCreditmodel.dart';
import 'package:agro_invest/pages/Agriculteur/Demandes/CreditDetaillePage.dart';
import 'package:agro_invest/service/investisseurService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../configuration/configurationCouleur.dart';

class InvestissementDemandeEncour extends StatefulWidget {
  const InvestissementDemandeEncour({Key? key}) : super(key: key);

  @override
  State<InvestissementDemandeEncour> createState() => _InvestissementDemandeEncourState();

}
class _InvestissementDemandeEncourState extends State<InvestissementDemandeEncour> {
  InvestisseurService investisseurService =InvestisseurService();


  @override
  Widget build(BuildContext context) {
    final idInv = Provider.of<InvestisseurProvider>(context , listen: false).investisseur!.idInv;
    return SingleChildScrollView(
      child: FutureBuilder(
        future: investisseurService.demandeAccepterEncour(idInv!),
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
                  Text('Vous n\'avez effectuer aucune offre pour L\'instant',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), )
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

            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: (credits==null)?0:credits.length,
              itemBuilder: (context, index) {
                Credit credit = credits[index];
                // print(credits[index]);
                return Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 10),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CreditDetaille(credit: credit )));
                          },
                          title: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: credit.agriculteur?.image != null
                                    ? NetworkImage("http://10.0.2.2/""${credit.agriculteur?.image}") as ImageProvider<Object>?
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
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
