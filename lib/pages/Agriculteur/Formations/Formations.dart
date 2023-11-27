import 'package:flutter/material.dart';

import 'FormationDescription.dart';

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
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FormationDescription()));
                    },
                    title: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("asset/images/abeil.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(child: Text("Apiculture",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                              SizedBox(height: 10,),
                              FittedBox(child: Text("Découvrir les techniques de récolte de miel",style: TextStyle(fontSize: 10),)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FormationDescription()));
                    },
                    title: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("asset/images/abeil.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(child: Text("Apiculture",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                              SizedBox(height: 10,),
                              FittedBox(child: Text("Découvrir les techniques de récolte de miel",style: TextStyle(fontSize: 10),)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ) ,
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