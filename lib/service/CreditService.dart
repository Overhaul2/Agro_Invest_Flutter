import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'dart:convert';


import '../Provider/AgriculteurPovider.dart';

import '../model/AjouterCreditmodel.dart';

class CreditService{
  final BuildContext context;
  CreditService(this.context);

  static const String baseUrl= "http://10.175.48.77:8080/Credit/ajouter";

  Future<Credit> ajouter({
    required String titre,
    required String montant,
    required String dateDebut,
    required String durre,
    required String description,
    // File?audio,
  }) async {
    try {
      AgriculteurProvider agriculteurProvider =
      Provider.of<AgriculteurProvider>(context, listen: false);
      if (agriculteurProvider.agriculteur == null) {
        // Gérer le cas où agriculteur est null
        throw Exception("Agriculteur non trouvé");
      }

      var request = http.MultipartRequest('POST', Uri.parse(baseUrl));

      request.fields['credit'] = json.encode({
        "agriculteur": Provider.of<AgriculteurProvider>(context,listen: false).agriculteur!.toJson(),
        "titre": titre,
        "montant": montant,
        "dateDebut": dateDebut,
        "durre": durre,
        "description": description,
        // "audioDescriptionPath": audio
      });

      print(Provider.of<AgriculteurProvider>(context,listen: false).agriculteur!.toJson());

      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData =
        json.decode(await response.stream.bytesToString());
        print("idAgr: ${agriculteurProvider.agriculteur?.idAgr}");
        return Credit.fromJson(responseData);
      } else {
        final errorResponse = await response.stream.bytesToString();
        print('Erreur ajout de credit ${response.statusCode}, Message d\'erreur : $errorResponse');
        throw Exception('Échec : $errorResponse');
      }
    } catch (e) {
      throw Exception('ERREUR : $e');
    }
  }
}