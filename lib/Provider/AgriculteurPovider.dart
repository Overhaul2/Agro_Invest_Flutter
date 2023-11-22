import 'package:flutter/foundation.dart';
import 'package:agro_invest/model/Agriculteur.dart';

class AgriculteurProvider with ChangeNotifier {
  Agriculteur? _agriculteur;

  Agriculteur? get agriculteur => _agriculteur;

  void setAgriculteur(Agriculteur agriculteur) {
    _agriculteur = agriculteur;
    notifyListeners();
  }
}
