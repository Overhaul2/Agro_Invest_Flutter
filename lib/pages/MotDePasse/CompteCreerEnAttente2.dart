import 'package:agro_invest/pages/login.dart';
import 'package:flutter/material.dart';

class CompteCreerEnAttente2 extends StatefulWidget {
  const CompteCreerEnAttente2({Key? key}) : super(key: key);

  @override
  State<CompteCreerEnAttente2> createState() => _CompteCreerEnAttente2State();
}

class _CompteCreerEnAttente2State extends State<CompteCreerEnAttente2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: (BackButton()),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: SizedBox(
                  child: Image.asset("asset/images/Successmark.png"),
                ),
              ),
              SizedBox(height: 40,),
              FittedBox(
                child: Text("Information vérifier avec succès",style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 16
                ),),
              ), SizedBox(height: 40,),


              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 13,horizontal: 35),
                      backgroundColor: Color(0xA8008000),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () async {

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginAgriculteur()));
                  },
                  child: Text(
                    "Se connecter",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 200,
                child: Image.asset("asset/images/logo.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
