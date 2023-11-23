import 'package:agro_invest/model/Investisseur.dart';
import 'package:flutter/foundation.dart';
import 'package:agro_invest/model/Agriculteur.dart';

class InvestisseurProvider with ChangeNotifier {
  Investisseur? _investisseur;
  String? _idInv;

  Investisseur ? get investisseur => _investisseur;
  String? get userId => _idInv;

  void setInvestisseur(Investisseur investisseur) {
    _investisseur = investisseur;
    notifyListeners();
  }

  void setIdAgr(String IdAgr) {
    _idInv = _idInv;
    notifyListeners();
  }

  void clearInvestisseur() {
    _investisseur = null;
    _idInv = null;
    notifyListeners();
  }
}
