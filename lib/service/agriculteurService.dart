import 'dart:async';
import 'dart:convert';
import 'package:agro_invest/pages/Agriculteur/Accueil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:agro_invest/model/Agriculteur.dart';

class AgriculteurService {
  //creation de la methode inscrire agriculteur

  Future<http.Response> inscrire(
      String nomPrenom, String email,String telephone,String residense,String age,String image, String password, String passWordConfirm, String activiteMenee) async {
    //create uri
    var uri = Uri.parse("http://10.0.2.2:8080/agriculteur/inscrire");
    //header
    var headers = {"Content-Type": "application/json"};
    //body
    Map data = {
      "nomPrenom": "$nomPrenom",
      "email": "$email",
      "telephone": "$telephone",
      "residense": "$residense",
      "age": "$age",
      "image": "$image",
      "passWord": "$password",
      "passWordConfirm": "$passWordConfirm",
      "activiteMenee": "$activiteMenee"
    };
    //convert the above data into json
    var body = json.encode(data);
    print(body);
    var response = await http.post(uri, headers: headers, body: body);

    //print the response body
    print("${response.body}");

    return response;
  }
  Future<bool> loginAgriculteur(String email, String password) async {
    const apiUrl = "http://localhost:8080/agriculteur/connexion";

    final response = await http.get(
      Uri.parse("$apiUrl?email=$email&password=$password"));

    if (response.statusCode == 200) {
      // Connexion réussie
      if(response.body == "Agriculteur connecter avec succès"){
        return true;
      }
      print('Connexion réussie');
      //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Accueil()));
      return false;
    } else {
      print(response.body);
      // Identifiants invalides
      print('Email ou mot de passe incorrect');
      // Afficher un message d'erreur
     //ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(content: Text("Adresse Email ou mot de passe incorrect")));
      return false ;
    }
  }

}

