import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agro_invest/model/Agriculteur.dart';

import '../Provider/AgriculteurPovider.dart';

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
     //File ? image,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://10.175.48.77:8080/agriculteur/inscrire'),
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

      request.fields['agriculteur'] = json.encode({
        'nomPrenom': nomPrenom,
        'email': email,
        'age': age,
        'residense': residense,
        'activiteMenee': ActiviteMenee,
        'telephone': telephone,
        //'image': "",
        'passWord': passWord,
        'passWordConfirm': passWordConfirm,
      });

      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(await response.stream.bytesToString());
        Agriculteur agriculteur = Agriculteur.fromJson(responseData);
       // context.read<AgriculteurProvider>().setAgriculteur(agriculteur);
        return agriculteur;
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


  Future<Agriculteur?> loginAgriculteur(String email, String password) async {
    //const apiUrl = "http://localhost:8080/agriculteur/connexion";
    const apiUrl = "http://10.175.48.77:8080/agriculteur/connexion";

    final response =
        await http.get(Uri.parse("$apiUrl?email=$email&password=$password"));

    if (response.statusCode == 200) {
      // Connexion réussie
      return Agriculteur.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print(response.body);
      // Identifiants invalides
      return null;
    }
  }
}
