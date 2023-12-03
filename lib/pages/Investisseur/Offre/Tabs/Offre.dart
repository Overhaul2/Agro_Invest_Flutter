import 'package:agro_invest/service/investisseurService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Provider/InvestisseurProvider.dart';
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
                future: investisseurServices.OffreInvestisseurSansAgriculteur(idInv!),
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
              ),);
  }
}
