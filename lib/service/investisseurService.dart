import 'dart:async';
import 'dart:convert';
import 'package:agro_invest/model/AjouterOffremodel.dart';
import 'package:agro_invest/model/Investisseur.dart';
import 'package:http/http.dart' as http;


class InvestisseurService {
  //creation de la methode inscrire investisseur
  static const String baseUrl = "http://10.0.2.2:8080/investisseur/inscrire";
//inscription investisseur
  Future<Investisseur> inscrire({
    // required BuildContext context,
    required String nomPrenom,
    required String email,
    required String telephone,
    required String residense,
    required String passWord,
    required String passWordConfirm,
    //File ? image,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://10.0.2.2:8080/investisseur/inscrire'),
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

      request.fields['investisseur'] = json.encode({
        'nomPrenom': nomPrenom,
        'email': email,
        'residense': residense,
        'telephone': telephone,
        //'image': "",
        'passWord': passWord,
        'passWordConfirm': passWordConfirm,
      });

      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(await response.stream.bytesToString());
        Investisseur investisseur = Investisseur.fromJson(responseData);
        // context.read<AgriculteurProvider>().setAgriculteur(agriculteur);
        return investisseur;
      } else {
        final errorResponse = await response.stream.bytesToString();
        print('Impossible de créer un compte ${response.statusCode}, Message d\'erreur : $errorResponse');
        throw Exception('Échec : $errorResponse');
      }

      /*if (response.statusCode == 200 ||response.statusCode == 201 ) {
        final responseData = json.decode(await response.stream.bytesToString());
        //debugPrint(responseData.toString());
        //responseData.printInfo(); // Assurez-vous que cette fonction existe
        return Agriculteur.fromJson(responseData);

      } else {
        print('Impossible de créer un compte ${response.statusCode}');
        throw Exception('Échec :$e');
      };*/
    } catch (e) {
      throw Exception('ERREUR : $e');
    }
  }

//connection investisseur
  Future<Investisseur?> loginInvestisseur(String email, String password) async {
    //const apiUrl = "http://localhost:8080/investisseur/connexion";
    const apiUrl = "http://10.0.2.2:8080/investisseur/connexion";

    final response =
    await http.get(Uri.parse("$apiUrl?email=$email&password=$password"));

    if (response.statusCode == 200) {
      // Connexion réussie
      return Investisseur.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print(response.body);
      // Identifiants invalides
      return null;
    }
  }
//offres effectuer par un id investisseur
  Future<List<Offre>> OffreInvestisseur(int idInv) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/offre/list/$idInv'));

    if (response.statusCode == 200) {
      print(response);
      //print("object====================");
      // La requête a réussi,
      List<dynamic> data = jsonDecode(response.body);
      // print("azertyuiop");
      List<Offre> offres = data.map((offreData) => Offre.fromMap(offreData)).toList();
      // print("qsdfghjklm");
      return offres;
    } else {
      // Si la requête ne réussit pas, lancez une exception
      //throw Exception('Vous n\'avez effectuer aucune demande');
      throw Exception('Vous n\'avez effectuer aucune Offre');
    }
  }

  //Afficher tout les offres effectuer par l'investisseur connecter sans agriculteur
  Future<List<Offre>>  OffreInvestisseurSansAgriculteur(int idInv) async {
    //print('Avant recuperation');
    final response = await http.get(Uri.parse("http://10.0.2.2:8080/offre/offresansagriculteur"));
    // print('Apres recup : ${response.statusCode}');

    if (response.statusCode == 200) {
      // print("on est a 200" );
      final responseData = jsonDecode(response.body) as List;
      List<Offre> offres = responseData
          .map((offre) => Offre.fromMap(offre))
          .toList();
      // print(OffreAffichertout);
      return offres;
    } else {
      throw Exception('Impossible de recuperer les offres');
    }
  }
//tout les offres qui existe sans agriculteur(projet Agricole)
  Future<List<Offre>>  OffreSansAgriculteurs() async {
    //print('Avant recuperation');
    final response = await http.get(Uri.parse("http://10.0.2.2:8080/offre/offresansagriculteur"));
    // print('Apres recup : ${response.statusCode}');
    if (response.statusCode == 200) {
      // print("on est a 200" );
      final responseData = jsonDecode(response.body) as List;
      List<Offre> offres = responseData
          .map((offre) => Offre.fromMap(offre))
          .toList();
      print(OffreSansAgriculteurs);
      return offres;
    } else {
      throw Exception('Impossible de recuperer les offres');
    }
  }
//la methode qui permet a un investisseur d'accepter une demande de credit
  Future<void> accepterDemandeCredit(int idCredit, int idInv) async {
    final url = 'http://10.0.2.2:8080/Credit/accepterDemande/$idCredit/$idInv';

    try {
      final response = await http.put(Uri.parse(url));
      if (response.statusCode == 200) {
        print('Investisseur ajouté avec succès au crédit');
      } else {
        print('Échec de l\'ajout de l\'investisseur au crédit - ${response.statusCode}');
      }
    } catch (error) {
      print('Erreur lors de la requête : $error');
    }
  }

}
