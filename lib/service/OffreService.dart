import 'dart:io';

import 'package:agro_invest/Provider/InvestisseurProvider.dart';
import 'package:agro_invest/model/AjouterOffremodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'dart:convert';



import '../model/AjouterCreditmodel.dart';

class OffreService{
  final BuildContext context;
  OffreService(this.context);

  static const String baseUrl= "http://10.0.2.2:8080/offre/ajouter";

  Future<Offre> ajouterOffre({
    required String titre,
    required String montant,
    required String dateDebut,
    required String durre,
    required String description,
     File?audio,
  }) async {
    try {
      InvestisseurProvider investisseurProvider =
      Provider.of<InvestisseurProvider>(context, listen: false);
      if (investisseurProvider.investisseur == null) {
        // Gérer le cas où l'investisseur est null
        throw Exception("Investisseur non trouvé");
      }



      var request = http.MultipartRequest('POST', Uri.parse(baseUrl));

      if (audio != null) {
        // Ajoute du fichier audio au champ
        request.files.add(await http.MultipartFile.fromPath('audioDescriptionPath', audio.path));
      }
      request.fields['offre'] = json.encode({
        "investisseur": Provider.of<InvestisseurProvider>(context,listen: false).investisseur!.toJson(),
        "titre": titre,
        "montant": montant,
        "dateDebut": dateDebut,
        "durre": durre,
        "description": description,
      });

      //print(Provider.of<AgriculteurProvider>(context,listen: false).agriculteur!.toJson());

      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData =
        json.decode(await response.stream.bytesToString());
        print("id Investisseur: ${investisseurProvider.investisseur?.idInv}");
        return Offre.fromMap(responseData);
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