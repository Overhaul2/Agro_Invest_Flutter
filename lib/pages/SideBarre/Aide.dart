import 'package:flutter/material.dart';

class Aide extends StatefulWidget {
  const Aide({Key? key}) : super(key: key);

  @override
  State<Aide> createState() => _AideState();
}

class _AideState extends State<Aide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aide"),
      ),
    );
  }
}
