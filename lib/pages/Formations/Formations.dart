import 'package:flutter/material.dart';

class Formations extends StatefulWidget {
  const Formations({Key? key}) : super(key: key);

  @override
  State<Formations> createState() => _FormationsState();
}

class _FormationsState extends State<Formations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: (BackButton()),
        title: Center(
          child: Text("Formations"),
        ),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.search_outlined))
        ],
      ),
    );
  }
}


class RechercheFormation extends staleLessWidget {
}

class staleLessWidget {
}

@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Container(
        width: double.infinity,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_outlined),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: (){},
              ),
              hintText: "Recherche...",
              border: InputBorder.none
            ),
          ),
        ),
      ),
    ),
  );
}