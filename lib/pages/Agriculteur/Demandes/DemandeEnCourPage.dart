import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AgriculteurPovider.dart';
import '../../../configuration/configurationCouleur.dart';
import '../../../model/AjouterCreditmodel.dart';
import '../../../service/agriculteurService.dart';

class DemandeEnCour extends StatefulWidget {
  const DemandeEnCour({Key? key}) : super(key: key);

  @override
  State<DemandeEnCour> createState() => _DemandeEnCourState();
}

class _DemandeEnCourState extends State<DemandeEnCour> {
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
            FittedBox(child: Text("Mes demandes en Cours", style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30, color: MesCouleur().couleurPrincipal),),),

            FutureBuilder(
              future: agriculteurServices.CreditAgriculteur(idAgr!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erreur: ${snapshot.error}');
                } else {
                  List<Credit> credits = snapshot.data!;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: (credits==null)?0:credits.length,
                      itemBuilder: (context, index) {
                        Credit credit = credits[index];
                        // print(credits[index]);
                        return Card(
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 10,
                          color: Colors.green,
                          child: ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: credit.agriculteur?.image != null
                                        ? NetworkImage("${credit.agriculteur?.image}") as ImageProvider<Object>?
                                        : AssetImage("asset/images/logo.png") as ImageProvider<Object>?,
                                    radius: 40,
                                  ),
                                  Row(
                                    children: [
                                      FittedBox(child: Text(" ${credit.titre} mois")),
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
