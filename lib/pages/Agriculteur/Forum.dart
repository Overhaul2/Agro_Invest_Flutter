import 'package:flutter/material.dart';

class Forums extends StatefulWidget {
  const Forums({Key? key}) : super(key: key);

  @override
  State<Forums> createState() => _ForumsState();
}

class _ForumsState extends State<Forums> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: (BackButton()),
    title: Text("Forum de Discussion"),),
    body: Center(),
    );
  }
}
