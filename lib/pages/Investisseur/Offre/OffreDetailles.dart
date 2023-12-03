import 'package:agro_invest/model/AjouterOffremodel.dart';
import 'package:flutter/material.dart';
import '../../../model/AjouterCreditmodel.dart';

class OffreDetail extends StatefulWidget {
  final Offre offre;
  const OffreDetail({Key? key,  required this.offre}) : super(key: key);

  @override
  State<OffreDetail> createState() => _OffreDetailState();
}

class _OffreDetailState extends State<OffreDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Offre Detaille"),
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
                              backgroundImage: widget.offre.agriculteur?.image != null
                                  ? NetworkImage("${widget.offre.agriculteur?.image}") as ImageProvider<Object>
                                  : AssetImage("asset/images/logo.png") as ImageProvider<Object>,
                            radius: 20,),
                            title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Informations de l'Agriculteur:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Text("Nom: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text("${widget.offre.agriculteur?.nomPrenom}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Résidense : ", style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text("${widget.offre.agriculteur?.residense}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Téléphone : ", style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text("+223 ${widget.offre.agriculteur?.telephone}"),
                                  ],
                                ),
                              ],
                            ),
                          ),SizedBox(height: 20,),
                          Row(
                            children: [
                              Text("Titre : ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("${widget.offre.titre}"),
                            ],
                          ),SizedBox(height: 10,),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text("Montant : ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("${widget.offre.montant} Fcfa"),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text("Duréé : ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("${widget.offre.durre} mois"),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text("Description : ", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("${widget.offre.description}"),
                          SizedBox(height: 45,),
                Container(
                  alignment: Alignment.center,
                  child: widget.offre.agriculteur == null
                      ? ElevatedButton(
                      onPressed: () {
                      },
                      child: Text("Modifier"))
                      : Container(),
                )
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
          TextButton(onPressed: resset, child: Text("Valider")),
        ],
      ));

  void submit() {
    Navigator.of(context).pop();
  }

  void resset() {
    Navigator.pop(context);
  }

}
