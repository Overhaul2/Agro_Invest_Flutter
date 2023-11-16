import 'package:flutter/material.dart';

class ApproposApplication extends StatefulWidget {
  const ApproposApplication({Key? key}) : super(key: key);

  @override
  State<ApproposApplication> createState() => _ApproposApplicationState();
}

class _ApproposApplicationState extends State<ApproposApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appropos de Agro Inves"),
      ),
    );
  }
}
