import 'package:agro_invest/pages/MotDePasse/ModePasseChanger.dart';
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
        child: Column(
          children: [
            Container(
              child:Image.asset("asset/images/blob.png"),
            ),
            SizedBox(height: 20,),
            FittedBox(
              child: Text("Veillez choisir un nouveau mot de passe",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),),
            ),
            Expanded(child: SingleChildScrollView(
              child: Form(child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0,right: 40, top: 100),
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 85, vertical: 18),
                          backgroundColor: Color(0xA8008000),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                      onPressed: ()  {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MotDePasseChanger()));
                      },
                      child: Text("Enrregistrer",
                        style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Container(
                    child: Image.asset("asset/images/motdepassenouveau.png",height: 300,),
                  )
                ],
              )),
            ))

          ],
        ),
      ),
    );
  }
}
