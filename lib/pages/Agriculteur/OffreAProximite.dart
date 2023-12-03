import 'package:agro_invest/model/AjouterOffremodel.dart';
import 'package:agro_invest/pages/Agriculteur/Demandes/OffreDetaillePage.dart';
import 'package:agro_invest/service/investisseurService.dart';
import 'package:flutter/material.dart';

import '../../configuration/configurationCouleur.dart';

class OffreAProximite extends StatefulWidget {
  const OffreAProximite({Key? key}) : super(key: key);

  @override
  State<OffreAProximite> createState() => _OffreAProximiteState();
}
class _OffreAProximiteState extends State<OffreAProximite> {
  InvestisseurService investisseurService = InvestisseurService();
 // final OffreService offreService = OffreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (BackButton()),
        title: Center(child: Text("Offre A Proximite")),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              FutureBuilder(
                future: investisseurService.OffreSansAgriculteurs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Erreur: ${snapshot.error}');
                  } else {
                    List<Offre> offres = snapshot.data!;

                    if (offres.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 200),
                        child: Center(
                          child: Container(
                            child: Column(
                              children: [
                                Text('Aucune offre disponible pour l\'instant !',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),SizedBox(height: 20,),
                                Image.asset('asset/images/notfound.jpg'),
                                Text('Revenez plustard',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 100,
                        child: ListView.builder(
                          itemCount: offres.length,
                          itemBuilder: (context, index) {
                            Offre offre = offres[index];
                            return Card(
                              clipBehavior: Clip.hardEdge,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: MesCouleur().couleurPrincipal
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 10,
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => OffreDetailleAgriculteur(offre: offre)));
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
                                              width: 265,
                                              child: Text(" ${offre.titre} "))),
                                          FittedBox(child: Text("Montant : ${offre.montant} Fcfa ")),
                                          FittedBox(child: Text("Durée ${offre.durre} mois ")),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );}
}
