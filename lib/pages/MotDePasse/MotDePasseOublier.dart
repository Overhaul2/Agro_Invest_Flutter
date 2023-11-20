import 'package:agro_invest/pages/Agriculteur/Accueil.dart';
import 'package:agro_invest/pages/MotDePasse/NouveauMotdePasseOublier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MotDePasseOublier extends StatefulWidget {
  const MotDePasseOublier({Key? key}) : super(key: key);

  @override
  State<MotDePasseOublier> createState() => _MotDePasseOublierState();
}

class _MotDePasseOublierState extends State<MotDePasseOublier> {
  final _formkey=GlobalKey<FormState>();
  final _emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
                child: SizedBox(child: Image.asset("asset/images/blob.png"),)),
            SizedBox(height: 15,),
            Container(
              child: Column(
                children: [
                  FittedBox(
                    child: Text("Mot de passe oublie ?",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 30,),
                  FittedBox(
                    child: Text("Veillez saisir votre adresse email"),
                  )
                ],
              ),
            ),
            SizedBox(height: 50,),
            Expanded(child: SingleChildScrollView(
              child: Form(
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
                          child: TextFormField(
                            onTapOutside: (e) =>FocusScope.of(context).unfocus(),
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
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              labelText: "Adresse Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              prefixIcon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: ElevatedButton(
                              style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 65, vertical: 18),
                                  backgroundColor: Color(0xA8008000),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                              onPressed: ()  {
                                //if(_formkey.currentState!.validate())
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NouveauMotdePasse()));
                              },
                              child: Text("Recevoir le code",
                                style: TextStyle(fontSize: 20,
                                    fontWeight: FontWeight.bold),),
                            ),
                      ),
                      SizedBox(height: 40,),

                      Container(
                        child: Image.asset("asset/images/motdepasseoublier.jpg",height: 300,),
                      )
                    ],
                  )),
            )),

          ],
        ),
      ),
    );
  }
}
