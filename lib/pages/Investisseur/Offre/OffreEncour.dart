import 'package:agro_invest/Provider/InvestisseurProvider.dart';
import 'package:agro_invest/pages/Investisseur/Offre/Tabs/Encour.dart';
import 'package:agro_invest/service/investisseurService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configuration/configurationCouleur.dart';
import 'Tabs/Offre.dart';

class OffreEnCour extends StatefulWidget {
  const OffreEnCour({Key? key}) : super(key: key);

  @override
  State<OffreEnCour> createState() => _OffreEnCourState();
}

class _OffreEnCourState extends State<OffreEnCour> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    /*final investisseurServices = InvestisseurService();
    final idInv = Provider.of<InvestisseurProvider>(context, listen: false).investisseur!.idInv;
*/
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(leading: (BackButton()),),
        body: Center(
          child: Column(
            children: [
              Container(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child:SizedBox(
                        child: Image.asset("asset/images/mesdemandes.jpg",fit: BoxFit.fitWidth,)),)
              ),
              SizedBox(height: 20,),
              FittedBox(child: Text("Mes Offres en Cours", style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 30, color: MesCouleur().couleurPrincipal),),),

              TabBar(
                labelColor: MesCouleur().couleurPrincipal,
                unselectedLabelColor: Colors.black87,

                onTap: (index){
                  setState(() {
                    currentIndex = index;

                  });
                },
                tabs: [
                Tab(icon: Text("Demande", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),)),
                Tab(icon: Text("Offre", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              ],),

            Expanded(
              child: Column(
              children: [
              (currentIndex == 0)? InvestissementDemandeEncour()
              : InvestissementOffreEnCour(),
        ],
      ),
            ),

            ],
          ),


        ),
      ),
    );
  }
}
