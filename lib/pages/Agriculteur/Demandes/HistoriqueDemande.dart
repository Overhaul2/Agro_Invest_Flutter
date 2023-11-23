import 'package:agro_invest/service/agriculteurService.dart';
import 'package:flutter/material.dart';

import '../../../configuration/configurationCouleur.dart';
import '../../../model/AjouterCreditmodel.dart';

class HistoriqueDemande extends StatefulWidget {
  const HistoriqueDemande({Key? key}) : super(key: key);

  @override
  State<HistoriqueDemande> createState() => _HistoriqueDemandeState();
}

class _HistoriqueDemandeState extends State<HistoriqueDemande> {
  AgriculteurService agriculteurService = AgriculteurService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (BackButton()),
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
            SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Text(
                "Mes historiques de demande",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: MesCouleur().couleurPrincipal),
              ),
            ),
            FutureBuilder(
              future: agriculteurService.affichertout(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erreur: ${snapshot.error}');
                } else {
                  List<Credit> credits = snapshot.data!;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: credits.length,
                      itemBuilder: (context, index) {
                        Credit credit = credits[index];
                       // print(credits[index]);
                        return ListTile(
                          title: Text('${credit.titre}'),
                          subtitle: Text(
                              'Durée${credit.idCredit} mois, ${credit.agriculteur?.idAgr}'),
                          // Ajoutez d'autres éléments d'interface utilisateur selon vos besoins
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
