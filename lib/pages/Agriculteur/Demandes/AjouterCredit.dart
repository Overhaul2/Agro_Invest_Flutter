
import 'package:agro_invest/pages/Agriculteur/Demandes/DemandeEnCourPage.dart';
import 'package:flutter/material.dart';
import 'package:agro_invest/service/CreditService.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
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
   // AgriculteurProvider agriculteurProvider = Provider.of<AgriculteurProvider>(context, listen: false);
  //  CreditService creditService = CreditService(context);
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
                            return 'Veuillez donner un titre à votre demande !';
                          } else if (value.length <= 10) {
                            return "Le titre doit contenir au moins 10 caractères";
                          } else if (value.length >= 31) {
                            return "Le titre ne doit pas dépasser 30 caractères";
                          } else if (RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                            return "Le titre ne doit contenir que des caractères alphabétiques";
                          } else {
                            return null;
                          }
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
                            return 'Veillez donner une description a votre demande !';
                          }if(value.length<=10){
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
                          prefixIcon: Icon(Icons.description_outlined,)
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6, // Ajustez la largeur comme nécessaire
                            child: Text(
                              "Description Audio",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16, // Ajustez la taille de la police comme nécessaire
                              ),
                            ),
                          ),
                          Expanded(
                            child:  Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SocialMediaRecorder(
                                  sendRequestFunction: (File ,soundFile) {},
                                  encode: AudioEncoderType.AAC,
                                  counterTextStyle: TextStyle(color: MesCouleur().couleurPrincipal),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                          //AgriculteurProvider agriculteurProvider = Provider.of<AgriculteurProvider>(context, listen: false);
                          CreditService creditService = CreditService(context);
                           if (_formkey.currentState!.validate()) {
                             try{
                               final titre= _nomController.text;
                               final montant= int.parse (_montantController.text);
                               final durre= int.parse(_durreController.text);
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
                               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DemandeEnCour()));

                             } catch (e) {
                               if (e is String) {
                                 // Gérer le cas où la réponse est une chaîne de caractères
                                 print('Réponse du serveur : $e');
                               } else {
                                 // Gérer d'autres types d'erreurs
                                 print('Erreur API: $e');
                               }
                               // Afficher une Snackbar ou faire d'autres actions en fonction du type d'erreur
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
