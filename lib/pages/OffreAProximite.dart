import 'package:flutter/material.dart';

class OffreAProximite extends StatefulWidget {
  const OffreAProximite({Key? key}) : super(key: key);

  @override
  State<OffreAProximite> createState() => _OffreAProximiteState();
}

class _OffreAProximiteState extends State<OffreAProximite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (BackButton()),
        title: Text("Offre A Proximite"),
      ),
    );
  }
}
