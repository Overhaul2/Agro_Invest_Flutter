import 'package:agro_invest/pages/Demarrage/DemandeEnCourPage.dart';
import 'package:flutter/material.dart';
import 'package:agro_invest/service/CreditService.dart';
import 'package:provider/provider.dart';
import '../../../Provider/AgriculteurPovider.dart';
import '../../../configuration/configurationCouleur.dart';

class FaireUneDemane extends StatefulWidget {
  const FaireUneDemane({Key? key}) : super(key: key);

  @override
  State<FaireUneDemane> createState() => _FaireUneDemaneState();
}

class _FaireUneDemaneState extends State<FaireUneDemane> {
  Map creditData = {};
  final _formkey= GlobalKey<FormState>();
  final _nomController=TextEditingController();
  final _montantController=TextEditingController();
  final _dateDebuitController=TextEditingController();
  final _descriptionController=TextEditingController();
  final _durreController=TextEditingController();
  final _audioController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    AgriculteurProvider agriculteurProvider = Provider.of<AgriculteurProvider>(context, listen: false);
    CreditService creditService = CreditService(context);
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
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 25.0),
                      child: TextFormField(
                        controller: _nomController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez donner un titre a votre demande !';
                          }if(value.length<=10){
                            return "le titre doit contenir au moins 10 caractère";
                          }else{
                            return null;}
                        },
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Titre",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.person),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 25.0),
                      child: TextFormField(
                        controller: _montantController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez donner le montant  !';
                          }if(value.length>=7){
                            return "Le montant doit être inferrieur a 1Million";
                          }else{
                            return null;}
                        },
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 25.0),
                      child: TextFormField(
                        controller: _dateDebuitController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez fournir le délait pout rembourser !';
                          }if(value.length>=11){
                            return "le délait est trop longue";
                          }else{
                            return null;}
                        },
                        onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                        //obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          labelText: "Date Debut",
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
                        controller: _durreController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez fournir le délait pout rembourser !';
                          }if(value.length>=3){
                            return "le délait est trop longue";
                          }else{
                            return null;}
                        },
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
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,top: 25.0),
                      child: TextFormField(
                        controller: _descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez donner un titre a votre demande !';
                          }if(value.length<=20){
                            return "description trop court";
                          }else{
                            return null;}
                        },
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
                      child: TextFormField(
                        controller: _audioController,
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
                        onPressed: ()  async {
                          AgriculteurProvider agriculteurProvider = Provider.of<AgriculteurProvider>(context, listen: false);
                          CreditService creditService = CreditService(context);
                           if (_formkey.currentState!.validate()) {
                             try{
                               final titre= _nomController.text;
                               final montant= _montantController.text;
                               final durre= _durreController.text;
                               final dateDebut = _dateDebuitController.text;
                               //final audioDescriptionPath=_audioController.text;
                               final description = _descriptionController.text;
                               final result = await creditService.ajouter(titre: titre,
                                   montant: montant,
                                   description: description,
                                   durre: durre,
                                   dateDebut: dateDebut );
                               print('Demande effectuer avec succes : ${result.toString()}');
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Demande effectuer avec succès")));
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DemandeEnCour()));

                             }catch(e){
                               print('Erreur API: $e');
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Une erreur s'est produite ; veillez verifier toute vos information; Vous ne pouver pas envoyer deux demande avec le même nom")));

                             }
                           }


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
