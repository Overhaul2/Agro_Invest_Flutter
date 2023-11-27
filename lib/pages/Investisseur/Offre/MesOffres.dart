import 'package:agro_invest/configuration/configurationCouleur.dart';
import 'package:agro_invest/pages/Agriculteur/Demandes/DemandeEnCourPage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../ProjetAgricole.dart';
import 'AjouterOffre.dart';

class MesOffres extends StatefulWidget {
  const MesOffres({Key? key}) : super(key: key);

  @override
  State<MesOffres> createState() => _MesOffresState();
}

class _MesOffresState extends State<MesOffres> {
  @override
  Widget build(BuildContext context) {
    //final agriculteurServices = AgriculteurService();
    //final idAgr = Provider.of<AgriculteurProvider>(context, listen: false).agriculteur!.idAgr;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: (BackButton()),
        ),
        body: Center(
            child: Column(children: [
          Container(
              child: SizedBox(
                  child: Image.asset(
            "asset/images/mesdemandes.jpg",
            height: 250,
          ))),
          FittedBox(
            child: Text(
              "Mes Offres d’Investissements",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: MesCouleur().couleurPrincipal),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: MesCouleur().couleurPrincipal)),
            elevation: 10,
            shadowColor: MesCouleur().couleurPrincipal,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DemandeEnCour()));
              },
              child: SizedBox(
                width: 350,
                height: 70,
                child: Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Center(
                      child: Text(
                        'Investissements en Cours',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                side: BorderSide(color: MesCouleur().couleurPrincipal)),
            elevation: 10,
            shadowColor: MesCouleur().couleurPrincipal,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DemandeEnCour()));
              },
              child: SizedBox(
                width: 350,
                height: 70,
                child: Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Center(
                      child: Text(
                        'Offres proposées',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: MesCouleur().couleurPrincipal)),
            elevation: 10,
            shadowColor: MesCouleur().couleurPrincipal,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HistoriqueDemande()));
              },
              child: SizedBox(
                width: 350,
                height: 70,
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Center(
                          child: Text(
                            'Historiques',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  backgroundColor: Color(0xA8008000),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FaireUneOffre()));
              },
              child: Text(
                "Ajouter une Offre",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
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
        ])));
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
            ConnectivityResult result =
                await Connectivity().checkConnectivity();
            print(result.toString());
          },
          child: const Text("Actualiser"),
        ),
      ],
    );
  }
}
