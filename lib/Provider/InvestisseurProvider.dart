import 'package:agro_invest/model/Investisseur.dart';
import 'package:flutter/foundation.dart';

class InvestisseurProvider with ChangeNotifier {
  Investisseur? _investisseur;
  int? _idInv;

  Investisseur ? get investisseur => _investisseur;
  int? get userId => _idInv;

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
