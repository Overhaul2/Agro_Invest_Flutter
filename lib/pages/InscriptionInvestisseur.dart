import 'package:agro_invest/configuration/configurationCouleur.dart';
import 'package:agro_invest/pages/login.dart';
import 'package:flutter/material.dart';

class InscriptionInvestisseur extends StatefulWidget {
  const InscriptionInvestisseur({Key? key}) : super(key: key);

  @override
  State<InscriptionInvestisseur> createState() => _InscriptionInvestisseurState();
}

class _InscriptionInvestisseurState extends State<InscriptionInvestisseur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 19, 108, 22),
      //   elevation: 0,
      // ),

      body: Center(
            child: Column(
              children: [
                Container(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                        child:SizedBox(
                           child: Image.asset("asset/images/iinscription.jpg",fit: BoxFit.cover,)),)
                  ),
              Expanded(child: SingleChildScrollView
                (
                child: Column
                  (children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextField(
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Nom et Prenom",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.person,
                              color: Color(0xA8008000)),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: TextField(
                      //obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        labelText: "Adresse Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(Icons.email_rounded,
                            color: Color(0xA8008000)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextField(
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Téléphone",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.phone,
                              color: Color(0xA8008000)),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: TextField(
                      //obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        labelText: "Mot de Passe",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(Icons.lock,
                            color: Color(0xA8008000)),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: TextField(
                      //obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        labelText: "Confirmer le Mot de Passe",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(Icons.lock,
                            color: Color(0xA8008000)),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                          backgroundColor: Color(0xA8008000),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginAgriculteur()));
                      },
                      child: Text("S'inscrire",
                        style: TextStyle(fontSize: 25),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Row(
                      children: [
                        FittedBox(
                          child: Text("Vous avez déjà un compte ?",
                            style: TextStyle(
                              fontSize: 15,
                            ),),
                        ),
                        SizedBox(height: 60,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginAgriculteur()));
                          },
                          child: FittedBox(
                            child: Text("   Se Connecter",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: MesCouleur().couleurPrincipal
                              ),),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],),
              )
              )]
            ),

          ),
    );
  }
}

