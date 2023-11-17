import 'dart:developer';

import 'package:agro_invest/configuration/configurationCouleur.dart';
import 'package:agro_invest/model/Agriculteur.dart';
import 'package:agro_invest/pages/Agriculteur/Accueil.dart';
import 'package:agro_invest/pages/Demo2.dart';
import 'package:agro_invest/service/agriculteurService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginAgriculteur extends StatefulWidget {
  const LoginAgriculteur({Key? key}) : super(key: key);

  @override
  State<LoginAgriculteur> createState() => _LoginAgriculteurState();
}

class _LoginAgriculteurState extends State<LoginAgriculteur> {

  Map agriculteurData = {};
  final _formkey= GlobalKey<FormState>();
  final _emailController= TextEditingController();
  final _passWordController= TextEditingController();
  AgriculteurService _agriculteurService = AgriculteurService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 0),
            child: SizedBox(
              child: Image.asset("asset/images/blob.png"),
            ),),
            Container(
              child: Image.asset("asset/images/connexion.jpg",width: 300,height: 250,),
            ),
            SizedBox(height: 20,),
            Form(
                key: _formkey,
                child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: TextFormField(
                      //obscureText: true,
                      controller: _passWordController,
                      validator: (value){
                          if (value == null || value.isEmpty) {
                          return 'Veillez saisir votre adresse email !';
                          }
                          return null;
                          },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        labelText: "Adresse Email",
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
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: TextFormField(
                      //obscureText: true,
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veillez saisir votre mot de passe !';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        labelText: "Mot de Passe",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(Icons.lock,
                            color: Color(0xA8008000)),
                      ),
                      keyboardType: TextInputType.name,
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                InkWell(
                  onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Accueil()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 158.0),
                    child: FittedBox(
                      child: Text("Mot de passe oublier ?",
                        style: TextStyle(
                            fontFamily: "Inaka",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: MesCouleur().couleurPrincipal
                        ),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                        backgroundColor: Color(0xA8008000),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        // Si le formulaire est valide, effectuer la requête API
                        final email = _emailController.text; // Récupérez l'email à partir du champ de texte
                        final password = _passWordController.text; // Récupérez le mot de passe à partir du champ de texte
                        final success = await _agriculteurService.loginAgriculteur(email, password);
                        if(success){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Accueil()));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email ou mot de passe incorrect")));
                        }
                      }

                     // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Accueil()));
                    },
                    child: Text("Se Connecter",
                      style: TextStyle(fontSize: 25),),
                  ),
                ),
              ],
            ),
            ),

            SizedBox(height: 100,),

              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Row(
                  children: [
                    FittedBox(
                      child: Text("Vous n’avez pas de compte ?",
                      style: TextStyle(
                        fontSize: 15,
                      ),),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DemoPage2()));
                      },
                      child: FittedBox(
                        child: Text("   S'Inscrire",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: MesCouleur().couleurPrincipal
                          ),),
                      ),
                    ),

                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
  //FONCTION pour faire appel a la methode post api
//Future<void> login() async {
  //  await http.post(Uri.parse("http://localhost:8080/agriculteur/inscrire"), body: ({}));
//}
}
