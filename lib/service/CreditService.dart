import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'dart:convert';

import '../Provider/AgriculteurPovider.dart';

import '../model/AjouterCreditmodel.dart';

class CreditService {
  final BuildContext context;

  CreditService(this.context);

  static const String baseUrl = "http://10.0.2.2:8080/Credit/ajouter";

  Future<Credit> ajouter({
    required String titre,
    required int montant,
    required String dateDebut,
    required int durre,
    required String description,
    File? audio,
  }) async {
    try {
      AgriculteurProvider agriculteurProvider =
          Provider.of<AgriculteurProvider>(context, listen: false);
      if (agriculteurProvider.agriculteur == null) {
        // Gérer le cas où agriculteur est null
        throw Exception("Agriculteur non trouvé");
      }

      var request = await http.MultipartRequest('POST', Uri.parse(baseUrl));

      if (audio != null) {
        // Ajoute du fichier audio au champ
        request.files.add(await http.MultipartFile.fromPath(
            'audioDescriptionPath', audio.path));
      }
      request.fields['credit'] = json.encode({
        "agriculteur": Provider.of<AgriculteurProvider>(context, listen: false)
            .agriculteur!
            .toJson(),
        "titre": titre,
        "montant": montant,
        "dateDebut": dateDebut,
        "durre": durre,
        "description": description,
      });

      //print(Provider.of<AgriculteurProvider>(context,listen: false).agriculteur!.toJson());

      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(await response.stream.bytesToString());
        print("id Agriulteur: ${agriculteurProvider.agriculteur?.idAgr}");
        return Credit.fromMap(responseData);
      } else {
        final errorResponse = await response.stream.bytesToString();
        print(
            'Erreur ajout de credit ${response.statusCode}, Message d\'erreur : $errorResponse');
        throw Exception('Échec : $errorResponse');
      }
    } catch (e) {
      throw Exception('ERREUR : $e');
    }
  }
  static const String baseUrl2 = "http://10.0.2.2:8080/Credit/modiffier/";
  Future<Credit> modifier({
    required String titre,
    required int montant,
    required String dateDebut,
    required int durre,
    required String description,
    File? audio,
  }) async {
    try {
      AgriculteurProvider agriculteurProvider =
      Provider.of<AgriculteurProvider>(context, listen: false);
      if (agriculteurProvider.agriculteur == null) {
        throw Exception("Agriculteur non trouvé");
      }

      var request = http.MultipartRequest('PUT', Uri.parse(baseUrl2));

      if (audio != null) {
        // Ajoute du fichier audio au champ
        request.files.add(await http.MultipartFile.fromPath(
          'audioDescriptionPath',
          audio.path,
        ));
      }

      request.fields.addAll({
        "agriculteur": json.encode(
          agriculteurProvider.agriculteur!.toJson(),
        ),
        "titre": titre,
        "montant": montant.toString(),
        "dateDebut": dateDebut,
        "durre": durre.toString(),
        "description": description,
      });

      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData =
        json.decode(await response.stream.bytesToString());
        print("id Agriculteur: ${agriculteurProvider.agriculteur?.idAgr}");
        return Credit.fromMap(responseData);
      } else {
        final errorResponse = await response.stream.bytesToString();
        print(
          'Erreur Modification de crédit ${response.statusCode}, Message d\'erreur : $errorResponse',
        );
        throw Exception('Échec : $errorResponse');
      }
    } catch (e) {
      throw Exception('ERREUR : $e');
    }
  }

}
