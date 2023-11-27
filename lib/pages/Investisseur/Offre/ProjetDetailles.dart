import 'package:flutter/material.dart';
import '../../../model/AjouterCreditmodel.dart';

class ProjetsDetail extends StatefulWidget {
  final Credit credit;
  const ProjetsDetail({Key? key, required this.credit}) : super(key: key);

  @override
  State<ProjetsDetail> createState() => _ProjetsDetailState();
}

class _ProjetsDetailState extends State<ProjetsDetail> {
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
                                Text("Informations de l'Agriculteur:",style: TextStyle(fontSize: 18)),SizedBox(height: 10,),
                                Text("Nom: ${widget.credit.agriculteur?.nomPrenom}"),
                                Text("Résidense : ${widget.credit.agriculteur?.residense}"),
                                Text("Téléphone : ${widget.credit.agriculteur?.telephone}"),
                              ],
                            ),
                          ),SizedBox(height: 20,),
                          Text("Titre : ${widget.credit.titre} "),SizedBox(height: 10,),
                          Text("Montant : ${widget.credit.montant} Fcfa "),
                          Text("Duréé : ${widget.credit.durre} mois "),
                          Text("Description : ${widget.credit.description} "),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
