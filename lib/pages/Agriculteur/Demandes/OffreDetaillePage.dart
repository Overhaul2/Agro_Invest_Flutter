import 'package:agro_invest/Provider/AgriculteurPovider.dart';
import 'package:agro_invest/model/AjouterOffremodel.dart';
import 'package:agro_invest/pages/Agriculteur/Demandes/DemandeEnCourPage.dart';
import 'package:agro_invest/pages/Agriculteur/Demandes/ModifierCredit.dart';
import 'package:agro_invest/service/agriculteurService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/AjouterCreditmodel.dart';

class OffreDetailleAgriculteur extends StatefulWidget {
  final Offre offre;
  const OffreDetailleAgriculteur({Key? key, required this.offre}) : super(key: key);

  @override
  State<OffreDetailleAgriculteur> createState() => _OffreDetailleAgriculteurState();
}

class _OffreDetailleAgriculteurState extends State<OffreDetailleAgriculteur> {
  AgriculteurService agriculteurService =AgriculteurService();
  void _accepterOffre() {
    final idOf = widget.offre.idOf; // Remplacez par l'ID de votre crédit
    final idAgr = Provider.of<AgriculteurProvider>(context ,listen: false).agriculteur!.idAgr; // Remplacez par l'ID de votre investisseur
    agriculteurService.accepterOffreCredit(idOf!, idAgr!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Détails de L'offre"),
          ),
        ),
        body: Center(
            child: Column(children: [
          Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(width: 300,
                    child: Image.asset(
                  "asset/images/mesdemandes.jpg",
                  fit: BoxFit.fitWidth,
                )),
              )),
              SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 500,
                    child: Card(
                     // color: Color(0xB26DC76D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Colors.green),
                      ),
                      margin: EdgeInsets.all(20),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(alignment: Alignment.topRight,onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close_sharp)),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: widget.offre.offreInvestisseur?.image != null
                                    ? NetworkImage("${widget.offre.offreInvestisseur?.image}") as ImageProvider<Object>
                                    : AssetImage("asset/images/logo.png") as ImageProvider<Object>,
                              radius: 20,),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Informations de l'Agriculteur:", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

                                  SizedBox(height: 10),
                                  widget.offre.agriculteur != null
                                      ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Nom: ",style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text("${widget.offre.offreInvestisseur?.nomPrenom} "),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Résidence : ",style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text("${widget.offre.agriculteur?.residense}"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Téléphone : ",style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text("${widget.offre.agriculteur?.telephone}")
                                        ],
                                      ),

                                    ],
                                  )
                                      : Container(child: Text("Cette Offre n'a pas encore d'Agriculteur!"),),
                                ],
                              ),

                            ),SizedBox(height: 20,),
                            Text("Titre : ${widget.offre.titre} "),SizedBox(height: 10,),
                            SizedBox(height: 20,),
                            Text("Montant : ${widget.offre.montant} Fcfa "),
                            SizedBox(height: 20,),
                            Text("Duréé : ${widget.offre.durre} mois "),
                            SizedBox(height: 20,),
                            Text("Description : ${widget.offre.description} "),
                            SizedBox(height: 40,),
                            Container(alignment: Alignment.center,
                                child: ElevatedButton(onPressed: (){
                                  _accepterOffre();
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DemandeEnCour()));

                                }, child: Text("Accepter")))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ])));
  }
}
