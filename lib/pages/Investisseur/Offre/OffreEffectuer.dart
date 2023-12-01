import 'package:agro_invest/Provider/InvestisseurProvider.dart';
import 'package:agro_invest/model/AjouterOffremodel.dart';
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
            FittedBox(child: Text("Mes Offres ", style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30, color: MesCouleur().couleurPrincipal),),),

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
                        return Card(
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 10,
                        //  color: Colors.green,
                          child: ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: offre.agriculteur?.image != null
                                        ? NetworkImage("${offre.agriculteur?.image}") as ImageProvider<Object>?
                                        : AssetImage("asset/images/logo.png") as ImageProvider<Object>?,
                                    radius: 40,
                                  ),
                                  Row(
                                    children: [
                                      FittedBox(child: Text(" ${offre.titre} mois")),
                                    ],
                                  )
                                ],
                              )
                            // subtitle: Text(
                            //   'Durée${credit.idCredit} mois, ${credit.agriculteur?.idAgr}'),
                            // Ajoutez d'autres éléments d'interface utilisateur selon vos besoins
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
