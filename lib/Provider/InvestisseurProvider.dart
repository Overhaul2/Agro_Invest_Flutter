import 'package:agro_invest/model/Investisseur.dart';
import 'package:flutter/foundation.dart';

class InvestisseurProvider with ChangeNotifier {
  Investisseur? _investisseur;

  Investisseur? get investisseur => _investisseur;

  void setInvestisseur(Investisseur investisseur) {
    _investisseur = investisseur;
    notifyListeners();
  }
}
