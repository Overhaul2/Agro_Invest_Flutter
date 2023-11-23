import 'dart:async';
import 'dart:convert';
import 'package:agro_invest/model/Investisseur.dart';
import 'package:http/http.dart' as http;
import 'package:agro_invest/model/Agriculteur.dart';

import '../Provider/AgriculteurPovider.dart';

class InvestisseurService {
  //creation de la methode inscrire investisseur
  static const String baseUrl = "http://10.175.48.77:8080/investisseur/inscrire";

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
        Uri.parse('http://10.175.48.77:8080/investisseur/inscrire'),
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


  Future<Investisseur?> loginInvestisseur(String email, String password) async {
    //const apiUrl = "http://localhost:8080/investisseur/connexion";
    const apiUrl = "http://10.175.48.77:8080/investisseur/connexion";

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
}
