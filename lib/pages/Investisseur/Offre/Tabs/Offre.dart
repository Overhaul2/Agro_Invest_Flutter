import 'package:agro_invest/pages/Investisseur/Offre/OffreDetailles.dart';
import 'package:agro_invest/service/investisseurService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Provider/InvestisseurProvider.dart';
import '../../../../configuration/configurationCouleur.dart';
import '../../../../model/AjouterOffremodel.dart';

class InvestissementOffreEnCour extends StatefulWidget {
  const InvestissementOffreEnCour({Key? key}) : super(key: key);

  @override
  State<InvestissementOffreEnCour> createState() => _InvestissementOffreEnCourState();
}

class _InvestissementOffreEnCourState extends State<InvestissementOffreEnCour> {



  @override
  Widget build(BuildContext context) {
    InvestisseurService investisseurServices= InvestisseurService();
    final idInv = Provider.of<InvestisseurProvider>(context, listen: false).investisseur!.idInv;
    return SingleChildScrollView(child: FutureBuilder(
                future: investisseurServices.offreAccepter(idInv!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Erreur: ${snapshot.error}');
                  } else {
                    List<Offre> offres = snapshot.data!;
            if (offres == null || offres.isEmpty) {
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
                    "Vous n'avez aucune Offre Investissement en cour",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
              );
            }

            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: (offres == null) ? 0 : offres.length,
              itemBuilder: (context, index) {
                Offre offre = offres[index];
                // print(credits[index]);
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 18, top: 10),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OffreDetail(offre: offre)));
                        },
                        title: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: offre.agriculteur?.image != null
                                  ? NetworkImage("${offre.agriculteur?.image}")
                                      as ImageProvider<Object>?
                                  : AssetImage("asset/images/logo.png")
                                      as ImageProvider<Object>?,
                              radius: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 240,
                                      child: Text(
                                        " ${offre.titre} ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  FittedBox(
                                      child: Text(
                                          "Montant : ${offre.montant} Fcfa ")),
                                  FittedBox(
                                      child:
                                          Text("Durrée ${offre.durre} mois ")),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                );
              },
                    );
                  }
                },
              ),);
  }
}
