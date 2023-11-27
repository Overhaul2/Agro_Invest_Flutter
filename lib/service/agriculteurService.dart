import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:agro_invest/model/Agriculteur.dart';
import 'package:agro_invest/model/AjouterCreditmodel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path/path.dart';

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
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://10.0.2.2:8080/agriculteur/inscrire'),
      );

     if (image != null) {
        try {
          var imageBytes = await image.readAsBytes();
          request.files.add(http.MultipartFile(
            'image',
            ByteStream.fromBytes(imageBytes), // Utilisez ByteStream.fromBytes ici
            imageBytes.length,
          ));
        } catch (e) {
          print('Erreur lors de la lecture de l\'image : $e');
          // Gérer l'erreur d'une manière appropriée (ex: montrer un message à l'utilisateur)
          throw Exception('Erreur lors de la lecture de l\'image : $e');
        }
      }


      /*if (image != null) {
        request.files.add(http.MultipartFile(
          'images',
          image.readAsBytes().asStream(),
          image.lengthSync(),
          filename: basename(image.path),
        ));
      }
*/
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
        print(
            'Impossible de créer un compte ${response.statusCode}, Message d\'erreur : $errorResponse');
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
    const apiUrl = "http://10.0.2.2:8080/agriculteur/connexion";

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
  //liste des demande effectuer

  List<Credit> parseCredit(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Credit>((json) => Credit.fromJson(json)).toList();
  }

  Future<List<Credit>>  affichertout() async {
    //print('Avant recuperation');
    final response = await http.get(Uri.parse("http://10.0.2.2:8080/Credit/affichertout"));
   // print('Apres recup : ${response.statusCode}');

    if (response.statusCode == 200) {
     // print("on est a 200" );
      final responseData = jsonDecode(response.body) as List;
      List<Credit> credits = responseData
          .map((credit) => Credit.fromMap(credit))
          .toList();
     // print("data================");


      // //final List<Credit> affichertout = parseCredit(response.body);
      // List<Map<String, dynamic>> data= json.decode(response.body);
      // // Convertir la chaîne JSON en une liste d'objets Dart

      // if(data!=null){
      //   print("liste credi afficher");

      //   List<Credit> jsonList = data.map((json) => Credit.fromMap(json)).toList();
      //   //ListeCredit= List<Credit>.from(data);
      //   print("Apres");
      //   print(jsonList);
      // }else{
      //   print('liste de donnée est null');
      // }

      print(affichertout);
     return credits;
    } else {
      throw Exception('Impossible de recuperer les credits');
    }
  }

//filtrer les credit selon l'id de user

  /*Future<List<Credit>> CreditAgriculteur(int idAgr) async {
    final response = await http
        .get(Uri.parse("http://10.0.2.2:8080/Credit/affichertout"));

    if (response.statusCode == 200) {
      final List<Credit> tousLesCredits = parseCredit(response.body);

      // Filtrer les crédits pour ceux liés à l'agriculteur spécifié
      final creditsDeLagriculteur = tousLesCredits
          .where((credit) => credit.agriculteur?.idAgr == idAgr)
          .toList();

      return creditsDeLagriculteur;
    } else {
      throw Exception('Impossible de récupérer les crédits');
    }
  }*/


  Future<List<Credit>> CreditAgriculteur(int idAgr) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/Credit/list/$idAgr'));

    if (response.statusCode == 200) {
      print(response);
      //print("object====================");
      // La requête a réussi,
      List<dynamic> data = jsonDecode(response.body);
     // print("azertyuiop");
      List<Credit> credits = data.map((creditData) => Credit.fromMap(creditData)).toList();
     // print("qsdfghjklm");
      return credits;
    } else {
      // Si la requête ne réussit pas, lancez une exception
      //throw Exception('Vous n\'avez effectuer aucune demande');
      throw Exception('Vous n\'avez effectuer aucune demande');
    }
  }


}
