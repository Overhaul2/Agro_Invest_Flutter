import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:agro_invest/model/Agriculteur.dart';

class AgriculteurService {
  //creation de la methode inscrire agriculteur
  static const String baseUrl = "http://10.0.2.2:8080/agriculteur/inscrire";

  Future<Agriculteur> inscrire({
    required String nomPrenom,
    required String email,
    required String telephone,
    required String residense,
    required int age,
    required String password,
    required String passWordConfirm,
    required String ActiviteMenee,
    // File ? image,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://10.0.2.2:8080/agriculteur/inscrire'),
      );

      /*if (image != null) {
      try {
        var imageBytes = await image.readAsBytes();
        request.files.add(http.MultipartFile(
          'image',
          imageBytes.asStream(),
          imageBytes.length,
          filename: basename(image.path),
        ));
      } catch (e) {
        print('Erreur lors de la lecture de l\'image : $e');
        // Gérer l'erreur d'une manière appropriée (ex: montrer un message à l'utilisateur)
        throw Exception('Erreur lors de la lecture de l\'image : $e');
      }
    }*/

      request.fields['Agriculteur'] = json.encode({
        'nomPrenom': nomPrenom,
        'email': email,
        'age': age,
        'residense': residense,
        'activiteMenee': ActiviteMenee,
        'telephone': telephone,
        // 'image': "", // Mettez à jour cette valeur si nécessaire
        'password': password,
        'passWordConfirm': passWordConfirm,
      });

      var response = await request.send();

      if (response.statusCode == 200) {
        final responseData = json.decode(await response.stream.bytesToString());
        debugPrint(responseData.toString(responseData));
        // responseData.printInfo(); // Assurez-vous que cette fonction existe
        return Agriculteur.fromJson(responseData);
      } else {
        print('Impossible de créer un compte ${response.statusCode}');
        throw Exception('Échec de la requête avec le code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur ajout agriculteur : $e');
    }
  }


  Future<bool> loginAgriculteur(String email, String password) async {
    //const apiUrl = "http://localhost:8080/agriculteur/connexion";
    const apiUrl = "http://10.0.2.2:8080/agriculteur/connexion";

    final response =
        await http.get(Uri.parse("$apiUrl?email=$email&password=$password"));

    if (response.statusCode == 200) {
      // Connexion réussie
      if (response.body == "Agriculteur connecter avec succès") {
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
      return false;
    }
  }
}
