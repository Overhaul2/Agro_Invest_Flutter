import 'package:agro_invest/configuration/configurationCouleur.dart';
import 'package:agro_invest/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/AgriculteurPovider.dart';
import '../service/agriculteurService.dart';
import 'MotDePasse/CompteCreerEnattente.dart';

class InscriptionAgriculteur extends StatefulWidget {
  const InscriptionAgriculteur({Key? key}) : super(key: key);

  @override
  State<InscriptionAgriculteur> createState() => _InscriptionAgriculteurState();
}

class _InscriptionAgriculteurState extends State<InscriptionAgriculteur> {
  bool nonVisibles=false;
  bool nonVisible2=false;
  final _formkey = GlobalKey<FormState>();
  final _nomPrenomController = TextEditingController();
  final _emailController = TextEditingController();
  final _telephoneController= TextEditingController();
  final _ageController= TextEditingController();
  final _residenseController= TextEditingController();
  final _ActiviteMeneeController= TextEditingController();
  //final _imageController= TextEditingController();
  final _passWordController= TextEditingController();
  final _passWordConfirmController= TextEditingController();
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
                child: SizedBox(
                    child:
                    Image.asset("asset/images/agriculteur.jpg",fit: BoxFit.cover,)),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(radius: 64,
                          backgroundImage: AssetImage("asset/images/carteid.png"),),
                          Positioned(child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.camera_alt_outlined,),
                          ),bottom:
                            -10,
                          left: 80,)
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: TextFormField(onTapOutside: (_) => FocusScope.of(context).unfocus(),
                            controller: _nomPrenomController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veillez saisir votre nom et prénom !';
                              }if(value.length<=10){
                                return "veillez saisir un nom et prenom correct";
                              }else{
                              return null;}
                            },
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
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez saisir une adresse e-mail.';
                            }
                            // Utilisation d'une expression régulière pour vérifier une adresse e-mail simple
                            if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                              return 'Veuillez saisir une adresse e-mail valide.';
                            }
                            return null;
                          },
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
                          child: TextFormField(
                            controller: _telephoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veillez saisir votre Numero de Téléphone !';
                              }if(value.length<=7||value.length>=9){
                                return "Le numéro de téléphone doit contenir 8 chiffre";
                              }else{
                              return null;
                            }
                              },
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
                        ),),
                      SizedBox(height: 20,),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: TextFormField(
                            controller: _ageController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veillez saisir votre Age!';
                              }if(value.length<=1||value.length>=4){
                                return "Veillez saisir un Age Valide";
                              }else{
                              return null;
                            }},
                            //obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              labelText: "Age",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              prefixIcon: Icon(Icons.person,
                                  color: Color(0xA8008000)),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),),
                      SizedBox(height: 20,),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: TextFormField(
                            controller: _ActiviteMeneeController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veillez saisir votre Activité !';
                              }
                              return null;
                            },
                            //obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              labelText: "Activité menée",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              prefixIcon: Icon(Icons.work,
                                  color: Color(0xA8008000)),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),SizedBox(height: 20,),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: TextFormField(
                            controller: _residenseController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veillez saisir votre Résidense !';
                              }
                              return null;
                            },
                            //obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              labelText: "Résidense",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              prefixIcon: Icon(Icons.house,
                                  color: Color(0xA8008000)),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),
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
                          obscureText: !nonVisibles,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 20),
                            labelText: "Mot de Passe",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            prefixIcon: Icon(Icons.lock,
                                color: Color(0xA8008000)),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  nonVisibles=!nonVisibles;
                                });
                              },
                              icon: Icon(nonVisibles==false?Icons.visibility_off:Icons.visibility),
                            )
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: TextFormField(
                          controller: _passWordConfirmController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veillez saisir votre mot de passe de Validation !';
                            }if(value.length<=7){
                              return "Les deux mot de passe doivent être identique";
                            }else{
                              return null;}
                          },
                          //obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 20),
                            labelText: "Confirmer le Mot de Passe",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            prefixIcon: Icon(Icons.lock,
                                color: Color(0xA8008000)),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  nonVisible2=!nonVisible2;
                                });
                              },
                              icon: Icon(nonVisible2==false?Icons.visibility_off:Icons.visibility),
                            )
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: nonVisible2,
                        ),
                      ),
                      SizedBox(height: 20,),

                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                              backgroundColor: Color(0xA8008000),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              try {
                                final nomPrenom = _nomPrenomController.text;
                                final email = _emailController.text;
                                final telephone = _telephoneController.text;
                                final residense = _residenseController.text;
                                final age = int.parse(_ageController.text);
                                final ActiviteMenee = _ActiviteMeneeController.text;
                                final passWord = _passWordController.text;
                                final passWordConfirm = _passWordConfirmController.text;

                                final result = await AgriculteurService().inscrire(
                                 // context: context,
                                  nomPrenom: nomPrenom,
                                  email: email,
                                  telephone: telephone,
                                  residense: residense,
                                  age: age,
                                  ActiviteMenee: ActiviteMenee,
                                  // image: image, // Ajoutez la valeur de l'image si nécessaire
                                  passWord: passWord,
                                  passWordConfirm: passWordConfirm,
                                );
                                print('Inscription réussie : ${result.toString()}');
                                print('test:${result.idAgr}');

                                Provider.of<AgriculteurProvider>(context, listen: false).setAgriculteur(result);

                                //print('Inscription réussie : $result');

                                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CompteEnAttente()));
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Inscription Effectuer avec Succès !!!   En attente de verification du compte")));
                              } catch (e) {
                                print('Erreur API: $e');
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Erreur:$e")));
                              }
                            }
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
              ),
            )
          ],
        ),
      ),
    );
  }
}