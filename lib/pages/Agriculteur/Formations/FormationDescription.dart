import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormationDescription extends StatefulWidget {
  const FormationDescription({Key? key}) : super(key: key);

  @override
  State<FormationDescription> createState() => _FormationDescriptionState();
}

class _FormationDescriptionState extends State<FormationDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Apiculture")),
      ),
      body: Center(
          child: Column(children: [
        Container(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                  child: Image.asset(
                "asset/images/abeil.jpg",
                fit: BoxFit.fitWidth,
              )),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text("L'apiculture est la branche de l\’agriculture qui consiste en l’élevage "
                  "d’abeilles mellifères pour exploiter les produits de la ruche, principalement "
                  "du miel mais également la cire, la gelée royale, "
                  "le pollen et lapropolis, voire le venin d’abeille",
                style:TextStyle(
                  fontSize: 15,
                ) ,),
            ),
      ])),
    );
  }
}
