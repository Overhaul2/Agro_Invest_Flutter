import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MotDePasseOublier extends StatefulWidget {
  const MotDePasseOublier({Key? key}) : super(key: key);

  @override
  State<MotDePasseOublier> createState() => _MotDePasseOublierState();
}

class _MotDePasseOublierState extends State<MotDePasseOublier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("asset/images/blob.png", height: 180,),
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
                  SizedBox(height: 20,),
                  FittedBox(
                    child: Text("Veillez saisir votre adresse email"),
                  )
                ],
              ),

            ),
            Form(child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextFormField(
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return 'Veillez saisir votre adresse email !';
                          }
                          return null;
                      },
                      decoration: InputDecoration(
                        border: B
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
