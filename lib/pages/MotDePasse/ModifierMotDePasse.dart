import 'package:agro_invest/pages/login.dart';
import 'package:flutter/material.dart';

class ModifierMotDePasse extends StatefulWidget {
  const ModifierMotDePasse({Key? key}) : super(key: key);

  @override
  State<ModifierMotDePasse> createState() => _ModifierMotDePasseState();
}

class _ModifierMotDePasseState extends State<ModifierMotDePasse> {
  var nonVisible=false;
  var nonVisible2=false;
  var nonVisible3=false;
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
              child: Text("Attention Garder bien votre mot de passe",
                style: TextStyle(
                    fontSize: 18,
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
                        onTapOutside: (e)=>FocusScope.of(context).unfocus(),
                        obscureText: nonVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez saisir votre Ancien mot de passe !';
                          }if(value.length<=7){
                            return "Le mot de passe doit conténir au moins 8 caractère";
                          }else{
                            return null;}
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Anciens Mot de Passe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                  ),
                  SizedBox(height: 20,),Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0,right: 40,),
                      child: TextFormField(
                        obscureText: nonVisible2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez saisir votre nouveau mot de passe !';
                          }if(value.length<=7){
                            return "Le mot de passe doit conténir au moins 8 caractère";
                          }else{
                            return null;}
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Nouveau mot de passe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                nonVisible2=!nonVisible2;
                              });
                            },
                            icon: Icon(nonVisible==true?Icons.visibility_off:Icons.visibility),
                          )
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextFormField(
                        obscureText: nonVisible3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez saisir votre mot de passe !';
                          }if(value.length<=7){
                            return "Les deux mot de passe ne se corresponde pas !";
                          }else{
                            return null;}
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Confirmation du mot de passe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  nonVisible3=!nonVisible3;
                                });
                              },
                              icon: Icon(nonVisible==true?Icons.visibility_off:Icons.visibility),
                            )
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                          backgroundColor: Color(0xA8008000),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                      onPressed: ()  {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginAgriculteur()));
                      },
                      child: Text("Retour sur la page de connexion",
                        style: TextStyle(fontSize: 13,
                            fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Container(
                    child: Image.asset("asset/images/logo.png",height: 250,),
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
