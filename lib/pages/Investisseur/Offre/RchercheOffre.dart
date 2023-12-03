import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../Provider/AgriculteurPovider.dart';

class RechercheCredit extends StatefulWidget {
  const RechercheCredit({Key? key}) : super(key: key);

  @override
  State<RechercheCredit> createState() => _RechercheCreditState();
}

class _RechercheCreditState extends State<RechercheCredit> {
  String? query;
  TextEditingController queryTextEditingController =
      new TextEditingController();
  dynamic credit;

  @override
  Widget build(BuildContext context) {
    var credits;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Recherche Demande")),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: queryTextEditingController,
                      onTapOutside: (e) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.library_books),
                          suffixIcon: IconButton(
                            onPressed: () {
                              // String query= queryTextEditingController.text="";
                            },
                            icon: Icon(Icons.clear),
                          ),
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(width: 2))),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        this.query = queryTextEditingController.text;
                        _recherche(query!);
                      });
                    },
                    icon: Icon(
                      Icons.search,
                      size: 40,
                    ))
              ],
            ),
            /*ListView.builder(
              itemCount: credits.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(credit[index].titre),
                  subtitle: Text('Amount: ${credit[index].montant}'),
                  // Ajoutez d'autres widgets ici en fonction de votre modèle de données
                );
              },
            )*/
          ],
        ),
      ),
    );
  }

  void _recherche(String query) {

    String urlString = 'http://localhost:8080/Credit/recherche/$query';

    print(urlString);

    http.get(Uri.parse(urlString)).then((response) {
      setState(() {
        this.credit = jsonDecode(response.body);
      });
      print(response.body);
    }).catchError((error) {
      print(error);
    });
  }
}
