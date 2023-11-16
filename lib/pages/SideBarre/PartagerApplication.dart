import 'package:flutter/material.dart';

class PartagerApplication extends StatefulWidget {
  const PartagerApplication({Key? key}) : super(key: key);

  @override
  State<PartagerApplication> createState() => _PartagerApplicationState();
}

class _PartagerApplicationState extends State<PartagerApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: Text("Body"),),
    );
  }
}
