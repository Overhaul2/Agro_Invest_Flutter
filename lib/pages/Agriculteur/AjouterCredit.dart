import 'package:agro_invest/pages/MesDemandes.dart';
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
        elevation: 0,
        leading: (BackButton()),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                child: SizedBox(
                    child: Image.asset("asset/images/demandecredit.jpg",))
            ),
            FittedBox(child: Text("Formulaire de demande de micro_crédit", style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 18, color: MesCouleur().couleurPrincipal),),),
            Expanded(child: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 25.0),
                      child: TextField(
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Nom",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.person),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 25.0),
                      child: TextField(
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Montant en Fcfa",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.monetization_on_outlined,),),
                        keyboardType: TextInputType.numberWithOptions(decimal: false,signed: false),
                      ),
                    ),Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 25.0),
                      child: TextField(
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Durée (mois)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.timelapse_outlined,),
                        ),
                        keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
                      ),
                    ),Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 25.0),
                      child: TextFormField(
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.description_outlined,),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 25.0),
                      child: TextField(
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Description audio",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.person,
                              color: Color(0xA8008000)),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 13,horizontal: 75),
                            backgroundColor: Color(0xA8008000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () async {
                          // if (_formkey.currentState!.validate()) {
                          //   // Si le formulaire est valide, effectuer la requête API
                          //   final email = _emailController.text; // Récupérez l'email à partir du champ de texte
                          //   final password = _passWordController.text; // Récupérez le mot de passe à partir du champ de texte
                          //   final success = await _agriculteurService.loginAgriculteur(email, password);
                          //   if(success){
                          //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Accueil()));
                          //   }else{
                          //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email ou mot de passe incorrect")));
                          //   }
                          // }

                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => MesDemndes()));
                        },
                        child: Text(
                          "Enregistrer",
                          style: TextStyle(fontSize: 30),
                        ),
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
