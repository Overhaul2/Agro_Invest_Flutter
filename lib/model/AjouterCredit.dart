class AjouterCredit {
  int? _idCredit;
  String? _nom;
  String? _montant;
  String? _dateDebut;
  String? _dateFin;
  String? _description;
  String? _audioDescriptionPath;
  Null? _creditAgriculteur;
  Null? _offreInvestisseur;

  AjouterCredit(
      {int? idCredit,
        String? nom,
        String? montant,
        String? dateDebut,
        String? dateFin,
        String? description,
        String? audioDescriptionPath,
        Null? creditAgriculteur,
        Null? offreInvestisseur}) {
    if (idCredit != null) {
      this._idCredit = idCredit;
    }
    if (nom != null) {
      this._nom = nom;
    }
    if (montant != null) {
      this._montant = montant;
    }
    if (dateDebut != null) {
      this._dateDebut = dateDebut;
    }
    if (dateFin != null) {
      this._dateFin = dateFin;
    }
    if (description != null) {
      this._description = description;
    }
    if (audioDescriptionPath != null) {
      this._audioDescriptionPath = audioDescriptionPath;
    }
    if (creditAgriculteur != null) {
      this._creditAgriculteur = creditAgriculteur;
    }
    if (offreInvestisseur != null) {
      this._offreInvestisseur = offreInvestisseur;
    }
  }

  int? get idCredit => _idCredit;
  set idCredit(int? idCredit) => _idCredit = idCredit;
  String? get nom => _nom;
  set nom(String? nom) => _nom = nom;
  String? get montant => _montant;
  set montant(String? montant) => _montant = montant;
  String? get dateDebut => _dateDebut;
  set dateDebut(String? dateDebut) => _dateDebut = dateDebut;
  String? get dateFin => _dateFin;
  set dateFin(String? dateFin) => _dateFin = dateFin;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get audioDescriptionPath => _audioDescriptionPath;
  set audioDescriptionPath(String? audioDescriptionPath) =>
      _audioDescriptionPath = audioDescriptionPath;
  Null? get creditAgriculteur => _creditAgriculteur;
  set creditAgriculteur(Null? creditAgriculteur) =>
      _creditAgriculteur = creditAgriculteur;
  Null? get offreInvestisseur => _offreInvestisseur;
  set offreInvestisseur(Null? offreInvestisseur) =>
      _offreInvestisseur = offreInvestisseur;

  AjouterCredit.fromJson(Map<String, dynamic> json) {
    _idCredit = json['idCredit'];
    _nom = json['nom'];
    _montant = json['montant'];
    _dateDebut = json['dateDebut'];
    _dateFin = json['dateFin'];
    _description = json['description'];
    _audioDescriptionPath = json['audioDescriptionPath'];
    _creditAgriculteur = json['creditAgriculteur'];
    _offreInvestisseur = json['offreInvestisseur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCredit'] = this._idCredit;
    data['nom'] = this._nom;
    data['montant'] = this._montant;
    data['dateDebut'] = this._dateDebut;
    data['dateFin'] = this._dateFin;
    data['description'] = this._description;
    data['audioDescriptionPath'] = this._audioDescriptionPath;
    data['creditAgriculteur'] = this._creditAgriculteur;
    data['offreInvestisseur'] = this._offreInvestisseur;
    return data;
  }
}
