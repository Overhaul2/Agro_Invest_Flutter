import 'package:agro_invest/configuration/configurationCouleur.dart';
import 'package:agro_invest/pages/Demarrage/DemandeEnCourPage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../Investisseur/OffreCredit.dart';
import 'HistoriqueDemande.dart';

class MesDemndes extends StatefulWidget {
  const MesDemndes({Key? key}) : super(key: key);

  @override
  State<MesDemndes> createState() => _MesDemndesState();
}

class _MesDemndesState extends State<MesDemndes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: (BackButton()),
        ),
        body: Center(
            child: Column(
                children: [
                  Container(
                      child: SizedBox(
                          child: Image.asset(
                            "asset/images/mesdemandes.jpg", height: 250,))
                  ),
                  FittedBox(child: Text("Mes Demandes",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 30, color: MesCouleur().couleurPrincipal),),),
                  SizedBox(height: 60,),

                  Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: MesCouleur().couleurPrincipal)
                    ),
                    elevation: 10,
                    shadowColor: MesCouleur().couleurPrincipal,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DemandeEnCour()));
                      },
                      child: SizedBox(
                        width: 300,
                        height: 70,
                        child: Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Demandes En Cours', style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: MesCouleur().couleurPrincipal)
                    ),
                    elevation: 10,
                    shadowColor: MesCouleur().couleurPrincipal,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HistoriqueDemande()));
                      },
                      child: SizedBox(
                        width: 300,
                        height: 70,
                        child: Center(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Historiques', style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold,
                                ),),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 20),
                          backgroundColor: Color(0xA8008000),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FaireUneDemane()));
                      },
                      child: Text("Faire une Demande",
                        style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold),),
                    ),
                  ),
                  /*Container(
                    margin: const EdgeInsets.all(20),
                    width: double.infinity,
                    height: double.infinity,
                    child: StreamBuilder(
                      stream: Connectivity().onConnectivityChanged,
                      builder: (context,
                          AsyncSnapshot<ConnectivityResult> snapshot) {
                        // sometimes the stream builder doesn't work with simulator so you can check this on real devices to get the right result
                        print(snapshot.toString());
                        if (snapshot.hasData) {
                          ConnectivityResult? result = snapshot.data;
                          if (result == ConnectivityResult.mobile) {
                            return connected('Mobile');
                          } else if (result == ConnectivityResult.wifi) {
                            return connected('WIFI');
                          } else {
                            return noInternet();
                          }
                        } else {
                          return loading();
                        }
                      },
                    ),
                  )*/
                ]
            )
        )
    );
  }


  Widget loading() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }

  Widget connected(String type) {
    return Center(
      child: Text(
        "$type Connected",
        style: const TextStyle(
          color: Colors.green,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget noInternet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/no_internet.png',
          color: Colors.red,
          height: 100,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: const Text(
            "Pas de Connexion internet",
            style: TextStyle(fontSize: 22),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Text(
              "connecter vous a l'internet pour pouvoir ajouter une demane de crédit."),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          onPressed: () async {
            // You can also check the internet connection through this below function as well
            ConnectivityResult result = await Connectivity()
                .checkConnectivity();
            print(result.toString());
          },
          child: const Text("Actualiser"),
        ),
      ],
    );
  }
}