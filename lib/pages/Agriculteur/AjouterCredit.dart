import 'package:flutter/material.dart';

import '../../configuration/configurationCouleur.dart';

class FaireUneDemane extends StatefulWidget {
  const FaireUneDemane({Key? key}) : super(key: key);

  @override
  State<FaireUneDemane> createState() => _FaireUneDemaneState();
}

class _FaireUneDemaneState extends State<FaireUneDemane> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (BackButton()),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child:SizedBox(
                      child: Image.asset("asset/images/mesdemandes.jpg",height: 100,)),)
            ),
            SizedBox(height: 20,),
            FittedBox(child: Text("Formulaire de demande de micro_crédit", style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 18, color: MesCouleur().couleurPrincipal),),),
            Expanded(child: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 28.0),
                      child: TextField(
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Nom",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.person,
                              color: Color(0xA8008000)),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 28.0),
                      child: TextField(
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Montant en Fcfa",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.monetization_on_outlined,
                              color: Color(0xA8008000)),
                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: false,signed: false),
                      ),
                    ),Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 28.0),
                      child: TextField(
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Durée (mois)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.timelapse_outlined,
                              color: Color(0xA8008000)),
                        ),
                        keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
                      ),
                    ),Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 28.0),
                      child: TextFormField(
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.description_outlined,
                              color: Color(0xA8008000)),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 28.0),
                      child: TextField(
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Nom",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.person,
                              color: Color(0xA8008000)),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
