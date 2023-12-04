import 'package:agro_invest/Provider/InvestisseurProvider.dart';
import 'package:agro_invest/model/AjouterOffremodel.dart';
import 'package:agro_invest/pages/Investisseur/Offre/OffreEffectuerDetaillePage.dart';
import 'package:agro_invest/service/investisseurService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AgriculteurPovider.dart';
import '../../../configuration/configurationCouleur.dart';
import '../../../model/AjouterCreditmodel.dart';
import '../../../service/agriculteurService.dart';

class OffreEffectuer extends StatefulWidget {
  const OffreEffectuer({Key? key}) : super(key: key);

  @override
  State<OffreEffectuer> createState() => _OffreEffectuerState();
}

class _OffreEffectuerState extends State<OffreEffectuer> {
  @override
  Widget build(BuildContext context) {

    final investisseurServices = InvestisseurService();
    final idInv = Provider.of<InvestisseurProvider>(context, listen: false).investisseur!.idInv;

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
            FittedBox(child: Text("Mes Proposition d'Offres ", style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30, color: MesCouleur().couleurPrincipal),),),

            FutureBuilder(
              future: investisseurServices.OffreInvestisseur(idInv!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: Column(
                       children: [
                         Image.asset("asset/images/notfoundo.jpg"),
                         Text("Vous n'avez effectuer aucune Demande ",style: TextStyle(fontWeight: FontWeight.bold),)
                       ],
                    ),
                  );
                } else {
                  List<Offre> offres = snapshot.data!;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: (offres==null)?0:offres.length,
                      itemBuilder: (context, index) {
                        Offre offre = offres[index];
                        // print(credits[index]);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OffreEffectuerDetaille(offre: offre)));
                                },
                                title: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: offre.agriculteur?.image != null
                                          ? NetworkImage("${offre.agriculteur?.image}") as ImageProvider<Object>?
                                          : AssetImage("asset/images/logo.png") as ImageProvider<Object>?,
                                      radius: 40,
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(child: SizedBox(
                                              width: 260,
                                              child: Text(" ${offre.titre} "))),
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
