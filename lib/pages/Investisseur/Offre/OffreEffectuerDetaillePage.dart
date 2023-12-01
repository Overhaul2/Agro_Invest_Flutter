import 'package:agro_invest/model/AjouterOffremodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../model/AjouterCreditmodel.dart';

class OffreEffectuerDetaille extends StatefulWidget {
  final Offre offre;
  const OffreEffectuerDetaille({Key? key, required this.offre}) : super(key: key);

  @override
  State<OffreEffectuerDetaille> createState() => _OffreEffectuerDetailleState();
}

class _OffreEffectuerDetailleState extends State<OffreEffectuerDetaille> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Détails du Credit"),
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
                                backgroundImage: widget.offre.agriculteur?.image != null
                                    ? NetworkImage("${widget.offre.agriculteur?.image}") as ImageProvider<Object>
                                    : AssetImage("asset/images/logo.png") as ImageProvider<Object>,
                              radius: 20,),
                              title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Informations de l'Agriculteur :",
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text("Nom : ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text("${widget.offre.agriculteur?.nomPrenom}"),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Text("Résidence : ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text("${widget.offre.agriculteur?.residense}"),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Text("Téléphone : ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text("+223 ${widget.offre.agriculteur?.telephone}"),
                                    ],
                                  ),
                                ],

                              ),
                            ),SizedBox(height: 15,),
                            Text("Titre : ${widget.offre.titre} "),SizedBox(height: 10,),
                            SizedBox(height: 15,),
                            Text("Montant : ${widget.offre.montant} Fcfa "),
                            SizedBox(height: 15,),
                            Text("Duréé : ${widget.offre.durre} mois "),
                            SizedBox(height: 15,),
                            Text("Description : ${widget.offre.description} "),
                            SizedBox(height: 30),
                            Container(alignment: Alignment.center,
                                child: ElevatedButton(onPressed: (){}, child: Text("Modifier")))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]
            )
        )
    );
  }
  }

