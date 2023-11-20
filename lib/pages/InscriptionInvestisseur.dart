import 'package:agro_invest/configuration/configurationCouleur.dart';
import 'package:agro_invest/pages/login.dart';
import 'package:flutter/material.dart';

class InscriptionInvestisseur extends StatefulWidget {
  const InscriptionInvestisseur({Key? key}) : super(key: key);

  @override
  State<InscriptionInvestisseur> createState() =>
      _InscriptionInvestisseurState();
}

class _InscriptionInvestisseurState extends State<InscriptionInvestisseur> {
  bool nonVisible=false;
  bool nonVisible2=false;
  Map Investisseur={};
  final _formkey = GlobalKey<FormState>();
  final _nomPrenomController = TextEditingController();
  final _emailController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _ageController = TextEditingController();
  final _residenseController = TextEditingController();
  final _ActiviteMeneeController = TextEditingController();
  final _imageController = TextEditingController();
  final _passWordController = TextEditingController();
  final _passWordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 19, 108, 22),
      //   elevation: 0,
      // ),

      body: Center(
        child: Column(children: [
          Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    child: Image.asset(
                  "asset/images/iinscription.jpg",
                  fit: BoxFit.cover,
                )),
              )),
          Expanded(
              child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextFormField(
                        onTapOutside: (e) => FocusScope.of(context).unfocus(),
                        controller: _nomPrenomController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez saisir votre nom et prénom !';
                          }if(value.length<=10){
                            return "veillez saisir un nom et prenom correct";
                          }else{
                            return null;}
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Nom et Prenom",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon:
                              Icon(Icons.person, color: Color(0xA8008000)),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "veillez saisir votre adresse email";
                        }
                        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(value)) {
                          return 'Veuillez saisir une adresse e-mail valide.';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        labelText: "Adresse Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon:
                            Icon(Icons.email_rounded, color: Color(0xA8008000)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextFormField(
                        //obscureText: true,
                        controller: _telephoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez saisir votre Numero de Téléphone !';
                          }if(value.length<=7||value.length>=9){
                            return "Le numéro de téléphone doit contenir 8 chiffre";
                          }else{
                            return null;
                          }},
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Téléphone",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon:
                              Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: TextFormField(
                      controller: _passWordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veillez saisir votre mot de passe !';
                        }if(value.length<=7){
                          return "Le mot de passe doit conténir au moins 8 caractère";
                        }else{
                          return null;}
                      },
                      obscureText: nonVisible,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        labelText: "Mot de Passe",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              nonVisible=!nonVisible;
                            });
                          },
                          icon: Icon(nonVisible==true?Icons.visibility_off:Icons.visibility),
                        )
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: TextFormField(
                      controller: _passWordConfirmController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veillez saisir votre mot de passe !';
                        }if(value.length<=7){
                          return "Le mot de passe doit conténir au moins 8 caractère";
                        }else{
                          return null;}
                      },
                      obscureText: nonVisible2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        labelText: "Confirmer le Mot de Passe",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Color(0xA8008000)),
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              nonVisible2=!nonVisible2;
                            });

                          },
                          icon: Icon(nonVisible==true?Icons.visibility_off:Icons.visibility),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 90, vertical: 15),
                          backgroundColor: Color(0xA8008000),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginAgriculteur()));
                      },
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Row(
                      children: [
                        FittedBox(
                          child: Text(
                            "Vous avez déjà un compte ?",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginAgriculteur()));
                          },
                          child: FittedBox(
                            child: Text(
                              "   Se Connecter",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: MesCouleur().couleurPrincipal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ))
        ]),
      ),
    );
  }
}
