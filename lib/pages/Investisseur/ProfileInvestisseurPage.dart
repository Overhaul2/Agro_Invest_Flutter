import 'package:agro_invest/Provider/InvestisseurProvider.dart';
import 'package:agro_invest/configuration/configurationCouleur.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Provider/AgriculteurPovider.dart';
import '../Agriculteur/login.dart';

class InvestisseurProfil extends StatefulWidget {
  const InvestisseurProfil({Key? key}) : super(key: key);

  @override
  State<InvestisseurProfil> createState() => _InvestisseurProfilState();
}

class _InvestisseurProfilState extends State<InvestisseurProfil> {
  @override
  void initState() {
    super.initState();
  }

  String evaluer = '';

  void partagerApplication() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Profil",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                Positioned(
                  bottom: -80.0,
                  child: InkWell(
                    child: ClipOval(
                      child: Container(
                        width: 120,
                        height: 120,
                        child: Image.asset(
                          "asset/images/user1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 55,
            ),
            Transform.translate(
              offset: Offset(0, 30),
              child:
              Consumer<InvestisseurProvider>(
                builder: (context, investisseurPorvider, _) {
                  if (investisseurPorvider.investisseur != null) {
                    String? nomPrenom = investisseurPorvider.investisseur!.nomPrenom;
                    if (nomPrenom != null) {
                      return Text("$nomPrenom",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ));
                    } else {
                      return Text("Aucun Utilisateur Connecté",
                          style: TextStyle(color: Colors.black87));
                    }
                  } else {
                    return Text("");
                  }
                },
              ),

              /**/
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 40, right: 20),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation:  8,
                      child: ListTile(
                        onTap: () async {
                          final evaluer = await EvaluerApp();
                          if (evaluer == null || evaluer.isEmpty) return;
                        },
                        leading: Icon(
                          Icons.bookmark_add,
                          color: Colors.green,
                        ),
                        title: Text("Evaluer l'application"),
                      ),
                    ),SizedBox(height: 10,),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 8,
                      child: ListTile(
                        onTap: partagerApplication,
                        leading: Icon(
                          Icons.share,
                          color: Colors.green,
                        ),
                        title: Text("Contacter le support"),
                      ),
                    ),SizedBox(height: 10,),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 8,
                      child: ListTile(
                        onTap: () {
                          Apropos();
                        },
                        leading: Icon(
                          Icons.help_outline,
                          color: Colors.green,
                        ),
                        title: Text("A Propos"),
                      ),
                    ),SizedBox(height: 10,),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 8,
                      child: ListTile(
                        onTap: () {
                          SuprimerCompte();
                        },
                        leading: Icon(
                          Icons.delete_forever_rounded,
                          color: Colors.green,
                        ),
                        title: Text("Demander la Suppression de mon Compte"),
                      ),
                    ),SizedBox(height: 60,),
                    Card(
                      color: MesCouleur().couleurPrincipal ,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 8,
                      child: ListTile(
                        onTap: () {
                          sedeconecter();
                          Deconexion(context);
                        },
                        title: Center(
                            child: Text("Se Deconnecter",style: TextStyle(
                              fontSize: 25,fontWeight: FontWeight.bold
                            ),)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future EvaluerApp() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Evaluez l\'Application'),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'Saisir une Note'),
            ),
            actions: [
              TextButton(onPressed: resset, child: Text("Annuler")),
              TextButton(onPressed: submit, child: Text('Envoyer')),
            ],
          ));

  Future Apropos() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
                'L\'objectif principal est de relier les agriculteurs locaux à des investisseurs pour soutenir l\'achat de semences, d\'engrais et d\'équipements agricoles.'),            actions: [
              TextButton(onPressed: resset, child: Text("Fermer")),
            ],
          ));

  Future sedeconecter() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Voulez ête sur le point de vous deconnecter"),
            actions: [
              TextButton(onPressed: resset, child: Text("Annuler")),
              TextButton(onPressed: resset, child: Text("Se deconnecter")),
            ],
          ));

  Future SuprimerCompte() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
                "En enpuiyant sur \"Envoyer\" votre compte sera supprimer au cours des 72h prochain"),
            actions: [
              TextButton(onPressed: resset, child: Text("Annuler")),
              TextButton(onPressed: resset, child: Text("Envoyer")),
            ],
          ));

  void submit() {
    Navigator.of(context).pop();
  }

  void resset() {
    Navigator.pop(context);
  }


  SharedPreferences? pref;
  bool? isUserLoggedIn;
  // SharedPreferences? preferences;
  getSharedPreferenceValue() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      isUserLoggedIn = pref!.getBool("isUserLoggedIn") ?? false;
      print("Valeur de isUserLoggedIn : $isUserLoggedIn");
      isUserLoggedIn = pref!.getBool("isUserLoggedIn") ?? true;
    });
  }
  void Deconexion(BuildContext context) {
    pref?.setBool("isUserLoggedIn", false);

    setState(() {
      isUserLoggedIn = false;
    });

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginAgriculteur()),
          (Route<dynamic> route) => false,
    );

  }


}
