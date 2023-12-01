
import 'package:flutter/foundation.dart';
import 'package:agro_invest/model/AgriculteurModele.dart';

class AgriculteurProvider with ChangeNotifier {
  Agriculteur? _agriculteur;
  int? _idAgr;
  //String? _nomPrenom;

  Agriculteur? get agriculteur => _agriculteur;
  int? get idAgr => _idAgr;
 // String? get nomPrenom => _nomPrenom;

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
