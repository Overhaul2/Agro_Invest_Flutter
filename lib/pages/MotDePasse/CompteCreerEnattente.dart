import 'package:flutter/material.dart';

class CompteEnAttente extends StatefulWidget {
  const CompteEnAttente({Key? key}) : super(key: key);

  @override
  State<CompteEnAttente> createState() => _CompteEnAttenteState();
}

class _CompteEnAttenteState extends State<CompteEnAttente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: (BackButton()),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: SizedBox(
                  child: Image.asset("asset/images/Successmark.png"),
                ),
              ),
              SizedBox(height: 40,),
              FittedBox(
                child: Text("Votre compte a bien éte créer avec succès",style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 16
                ),),
              ), SizedBox(height: 40,),
              FittedBox(
                child: Text("Vérification des informations en cours ",style: TextStyle(
                  fontSize: 16,
                ),),
              ), SizedBox(height: 40,),
              FittedBox(
                child: Text("Cet Processus peut prendre jusquà 72H",style: TextStyle(
                  fontSize: 16
                ),),
              ),
              Container(
                width: 200,
                child: Image.asset("asset/images/logo.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
