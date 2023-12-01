import 'package:agro_invest/Provider/InvestisseurProvider.dart';
import 'package:agro_invest/model/AjouterOffremodel.dart';
import 'package:agro_invest/pages/Investisseur/Offre/MesOffres.dart';
import 'package:agro_invest/service/CreditService.dart';
import 'package:agro_invest/service/investisseurService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/AjouterCreditmodel.dart';

class ProjetsDetail extends StatefulWidget {
  final Credit credit;
  const ProjetsDetail({Key? key, required this.credit}) : super(key: key);

  @override
  State<ProjetsDetail> createState() => _ProjetsDetailState();
}

class _ProjetsDetailState extends State<ProjetsDetail> {
  InvestisseurService investisseurService =InvestisseurService();
  void _accepter() {
    final idCredit = widget.credit.idCredit; // Remplacez par l'ID de votre crédit
    final idInv = Provider.of<InvestisseurProvider>(context ,listen: false).investisseur!.idInv; // Remplacez par l'ID de votre investisseur
    investisseurService.accepterDemandeCredit(idCredit!, idInv!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Détails du Projets"),
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

              Expanded(
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
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: widget.credit.agriculteur?.image != null
                                  ? NetworkImage("${widget.credit.agriculteur?.image}") as ImageProvider<Object>
                                  : AssetImage("asset/images/logo.png") as ImageProvider<Object>,
                            radius: 20,),
                            title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Informations de l'Agriculteur:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Text("Nom: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text("${widget.credit.agriculteur?.nomPrenom}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Résidense : ", style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text("${widget.credit.agriculteur?.residense}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Téléphone : ", style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text("+223 ${widget.credit.agriculteur?.telephone}"),
                                  ],
                                ),
                              ],
                            ),
                          ),SizedBox(height: 20,),
                          Row(
                            children: [
                              Text("Titre : ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("${widget.credit.titre}"),
                            ],
                          ),SizedBox(height: 10,),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text("Montant : ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("${widget.credit.montant} Fcfa"),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text("Duréé : ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("${widget.credit.durre} mois"),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text("Description : ", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("${widget.credit.description}"),
                          SizedBox(height: 45,),
                          Container(alignment: Alignment.center,
                              child: ElevatedButton(onPressed: (){
                                Invesrtir();
                              }, child: Text("Accepter",style: TextStyle(fontWeight: FontWeight.bold),)))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }


  Future Invesrtir() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
            "En enpuiyant sur \"Valider\" ....."),
        actions: [
          TextButton(onPressed: resset, child: Text("Annuler")),
          TextButton(onPressed: () {
            _accepter;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MesOffres()));
          }, child: Text("Valider")),
        ],
      ));

  void submit() {
    Navigator.of(context).pop();
  }

  void resset() {
    Navigator.pop(context);
  }

}
