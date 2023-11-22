import 'package:flutter/foundation.dart';
import 'package:agro_invest/model/Agriculteur.dart';

class AgriculteurProvider with ChangeNotifier {
  Agriculteur? _agriculteur;
  String? _idAgr;

  Agriculteur? get agriculteur => _agriculteur;
  String? get userId => _idAgr;

  void setAgriculteur(Agriculteur agriculteur) {
    _agriculteur = agriculteur;
    notifyListeners();
  }

  void setIdAgr(String IdAgr) {
    _idAgr = _idAgr;
    notifyListeners();
  }

  void clearAgriculteur() {
    _agriculteur = null;
    _idAgr = null;
    notifyListeners();
  }
}
