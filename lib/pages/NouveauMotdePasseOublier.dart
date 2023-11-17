import 'package:agro_invest/pages/Agriculteur/Accueil.dart';
import 'package:agro_invest/pages/ModePasseChanger.dart';
import 'package:flutter/material.dart';

class NouveauMotdePasse extends StatefulWidget {
  const NouveauMotdePasse({Key? key}) : super(key: key);

  @override
  State<NouveauMotdePasse> createState() => _NouveauMotdePasseState();
}

class _NouveauMotdePasseState extends State<NouveauMotdePasse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("asset/images/blob.png"),
                  SizedBox(height: 40,),
                  Container (
                    child: Column(
                      children: [
                        FittedBox(
                          child: Text("Veillez choisir un nouveau mot de passe",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),

                  ),
                  SizedBox(height: 80,),
                  SingleChildScrollView(
                    child: Form(child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                            child: TextFormField(
                              obscureText: true,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return 'Veillez confirmer votre nouveau mot de passe !';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 20),
                                labelText: "Nouveau mot de passe",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                            child: TextFormField(
                              obscureText: true,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return 'Veillez saisir votre adresse email !';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 20),
                                labelText: "Confirmation du mot de passe",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                                  backgroundColor: Color(0xA8008000),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                              onPressed: ()  {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MotDePasseChanger()));
                              },
                              child: Text("Retour sur la page de connexion",
                                style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset("asset/images/motdepassenouveau.png",height: 300,),
                        )

                      ],
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
