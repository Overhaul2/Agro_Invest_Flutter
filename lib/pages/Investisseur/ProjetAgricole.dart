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
              child: Column(
                children: [
                  Text(
                    "Projets Agricole",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: MesCouleur().couleurPrincipal),
                  ),IconButton(onPressed: (){setState(() {

                  });}, icon: Icon(Icons.refresh,size: 20,color: Colors.red,))
                ],
              ),
            ),
            FutureBuilder(
              future: agriculteurService.afficherCreditSansInvestisseur(),
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
                        Text('une erreur s\'est produite',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), )
                      ],
                    );
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
