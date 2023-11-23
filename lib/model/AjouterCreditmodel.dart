class Credit {
  int? _idCredit;
  String? _titre;
  String? _montant;
  String? _dateDebut;
  int? _durre;
  String? _description;
  Null? _audioDescriptionPath;
  Null? _agriculteur;
  Null? _offreInvestisseur;

  Credit(
      {int? idCredit,
        String? titre,
        String? montant,
        String? dateDebut,
        int? durre,
        String? description,
        Null? audioDescriptionPath,
        Null? agriculteur,
        Null? offreInvestisseur}) {
    if (idCredit != null) {
      this._idCredit = idCredit;
    }
    if (titre != null) {
      this._titre = titre;
    }
    if (montant != null) {
      this._montant = montant;
    }
    if (dateDebut != null) {
      this._dateDebut = dateDebut;
    }
    if (durre != null) {
      this._durre = durre;
    }
    if (description != null) {
      this._description = description;
    }
    if (audioDescriptionPath != null) {
      this._audioDescriptionPath = audioDescriptionPath;
    }
    if (agriculteur != null) {
      this._agriculteur = agriculteur;
    }
    if (offreInvestisseur != null) {
      this._offreInvestisseur = offreInvestisseur;
    }
  }

  int? get idCredit => _idCredit;
  set idCredit(int? idCredit) => _idCredit = idCredit;
  String? get titre => _titre;
  set titre(String? titre) => _titre = titre;
  String? get montant => _montant;
  set montant(String? montant) => _montant = montant;
  String? get dateDebut => _dateDebut;
  set dateDebut(String? dateDebut) => _dateDebut = dateDebut;
  int? get durre => _durre;
  set durre(int? durre) => _durre = durre;
  String? get description => _description;
  set description(String? description) => _description = description;
  Null? get audioDescriptionPath => _audioDescriptionPath;
  set audioDescriptionPath(Null? audioDescriptionPath) =>
      _audioDescriptionPath = audioDescriptionPath;
  Null? get agriculteur => _agriculteur;
  set agriculteur(Null? agriculteur) => _agriculteur = agriculteur;
  Null? get offreInvestisseur => _offreInvestisseur;
  set offreInvestisseur(Null? offreInvestisseur) =>
      _offreInvestisseur = offreInvestisseur;

  Credit.fromJson(Map<String, dynamic> json) {
    _idCredit = json['idCredit'];
    _titre = json['titre'];
    _montant = json['montant'];
    _dateDebut = json['dateDebut'];
    _durre = json['durre'];
    _description = json['description'];
    _audioDescriptionPath = json['audioDescriptionPath'];
    _agriculteur = json['agriculteur'];
    _offreInvestisseur = json['offreInvestisseur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCredit'] = this._idCredit;
    data['titre'] = this._titre;
    data['montant'] = this._montant;
    data['dateDebut'] = this._dateDebut;
    data['durre'] = this._durre;
    data['description'] = this._description;
    data['audioDescriptionPath'] = this._audioDescriptionPath;
    data['agriculteur'] = this._agriculteur;
    data['offreInvestisseur'] = this._offreInvestisseur;
    return data;
  }
}
