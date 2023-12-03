import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:agro_invest/model/AgriculteurModele.dart';
import 'package:agro_invest/model/AjouterCreditmodel.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AgriculteurService {
  //creation de la methode inscrire agriculteur
  static const String baseUrl = "http://10.0.2.2:8080/agriculteur/inscrire";

  Future<Agriculteur> inscrire({
    // required BuildContext context,
    required String nomPrenom,
    required String email,
    required String telephone,
    required String residense,
    required int age,
    required String passWord,
    required String passWordConfirm,
    required String ActiviteMenee,
    File? image,
  }) async {
    try {

      getx.FormData data = getx.FormData({
        'agriculteur': jsonEncode({
          'nomPrenom': nomPrenom,
          'email': email,
          'age': age,
          'residense': residense,
          'activiteMenee': ActiviteMenee,
          'telephone': telephone,
          'passWord': passWord,
          'passWordConfirm': passWordConfirm,
        })
      });


      if (image != null) {
        try {
          String fileName = image.path.split("\\")[image.path.split("\\").length - 1];

          File imageFile = new File(image.path);
          if (await imageFile.exists()) {
            data.files.add(MapEntry("image", getx.MultipartFile(image, filename: fileName)));
          } else {
            throw new FileNotFoundException("Le fichier spécifié n'existe pas : " + image.path);
          }
        } catch (FileNotFoundException) {
    // Gestion des erreurs
    throw new Exception("Erreur lors de la lecture de l'image : ");
    }

    }

    print("Envoie");
      final response = await getx.GetConnect().post('http://10.0.2.2:8080/agriculteur/inscrire', data);
      // var response = await request.send();
      print("Envoyé");
      if (response.statusCode == 200 || response.statusCode == 201) {
        // final responseData = json.decode(await response.stream.bytesToString());
        // Agriculteur agriculteur = Agriculteur.fromMap(responseData);
        Agriculteur agriculteur = Agriculteur.fromJson(response.bodyString!);
        // context.read<AgriculteurProvider>().setAgriculteur(agriculteur);
        return agriculteur;
      } else {
        // final errorResponse = await response.stream.bytesToString();
        final errorResponse = await response.statusText;
        print(
            'Impossible de créer un compte ${response.statusCode}, Message d\'erreur : $errorResponse');
        throw Exception('Échec : $errorResponse');
      }

    } catch (e) {
      throw Exception('ERREUR : $e');
    }
  }


//connection Agriulteur
  Future<Agriculteur?> loginAgriculteur(String email, String password) async {
    //const apiUrl = "http://localhost:8080/agriculteur/connexion";
    const apiUrl = "http://10.0.2.2:8080/agriculteur/connexion";

    final response =
        await http.get(Uri.parse("$apiUrl?email=$email&password=$password"));

    if (response.statusCode == 200) {
      // Connexion réussie
      return Agriculteur.fromMap(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print(response.body);
      // Identifiants invalides
      return null;
    }
  }
//afficher tout les agriculteur
  Future<List<Agriculteur>>  affichertoutAgriculteur() async {
    //print('Avant recuperation');
    final response = await http.get(Uri.parse("http://10.0.2.2:8080/agriculteur/affichertout"));
    // print('Apres recup : ${response.statusCode}');

    if (response.statusCode == 200) {
      // print("on est a 200" );
      final responseData = jsonDecode(response.body) as List;
      List<Agriculteur> agriculteurs = responseData
          .map((agriculteur) => Agriculteur.fromMap(agriculteur))
          .toList();

      print(afficherCreditSansInvestisseur);
      return agriculteurs;
    } else {
      throw Exception('Impossible de recuperer les Agriculteur a proximoté');
    }
  }

  //liste des demande effectuer

  List<Credit> parseCredit(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Credit>((json) => Credit.fromJson(json)).toList();
  }
//recuperer tout les demandes de crédit agricole ou l'investisseur est null
  Future<List<Credit>>  afficherCreditSansInvestisseur() async {
    //print('Avant recuperation');
    final response = await http.get(Uri.parse("http://10.0.2.2:8080/Credit/creditsansinvestisseur"));
   // print('Apres recup : ${response.statusCode}');

    if (response.statusCode == 200) {
     // print("on est a 200" );
      final responseData = jsonDecode(response.body) as List;
      List<Credit> credits = responseData
          .map((credit) => Credit.fromMap(credit))
          .toList();

      print(afficherCreditSansInvestisseur);
     return credits;
    } else {
      throw Exception('Impossible de recuperer les credits');
    }
  }
//recuperer les demande de credit effectuer par l'agriculteur connecter sans investisseur
  Future<List<Credit>> CreditAgriculteur(int idAgr) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/Credit/list/$idAgr'));

    if (response.statusCode == 200) {
      print(response);
      List<dynamic> data = jsonDecode(response.body);
      List<Credit> credits = data.map((creditData) => Credit.fromMap(creditData)).toList();
      return credits;
    } else {
      throw Exception('Vous n\'avez effectuer aucune demande');
    }
  }
//Tout les demande ou l'investisseur n'est pas null avec id de l'agriculteur connecter
  Future<List<Credit>> demandeAccepter(int idAgr) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/Credit/investisseur/$idAgr'));

    if (response.statusCode == 200) {
      print(response);
      List<dynamic> data = jsonDecode(response.body);
      List<Credit> credits = data.map((creditData) => Credit.fromMap(creditData)).toList();
      return credits;
    } else {
      throw Exception('Vous n\'avez effectuer aucune demande');
    }
  }

  //la methode qui permet a un Agriculteur d'accepter une Offre de credit
  Future<void> accepterOffreCredit(int idOf, int idAgr) async {
    final url = 'http://10.0.2.2:8080/offre/accepterOffre/$idOf/$idAgr';

    try {
      final response = await http.put(Uri.parse(url));
      if (response.statusCode == 200) {
        print('Agriculteur ajouté avec succès a l\'Offre');
      } else {
        print('Échec de l\'ajout de l\'agriculteur a l\'offre - ${response.statusCode}');
      }
    } catch (error) {
      print('Erreur lors de la requête : $error');
    }
  }


}
