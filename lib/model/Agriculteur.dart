class Agriculteur {
  int? _idAgr;
  String? _nomPrenom;
  String? _email;
  int? _telephone;
  String? _residense;
  int? _age;
  String? _image;
  String? _passWord;
  String? _passWordConfirm;
  String? _activiteMenee;

  Agriculteur(
      {int? idAgr,
        String? nomPrenom,
        String? email,
        int? telephone,
        String? residense,
        int? age,
        String? image,
        String? passWord,
        String? passWordConfirm,
        String? activiteMenee}) {
    if (idAgr != null) {
      this._idAgr = idAgr;
    }
    if (nomPrenom != null) {
      this._nomPrenom = nomPrenom;
    }
    if (email != null) {
      this._email = email;
    }
    if (telephone != null) {
      this._telephone = telephone;
    }
    if (residense != null) {
      this._residense = residense;
    }
    if (age != null) {
      this._age = age;
    }
    if (image != null) {
      this._image = image;
    }
    if (passWord != null) {
      this._passWord = passWord;
    }
    if (passWordConfirm != null) {
      this._passWordConfirm = passWordConfirm;
    }
    if (activiteMenee != null) {
      this._activiteMenee = activiteMenee;
    }
  }

  int? get idAgr => _idAgr;
  set idAgr(int? idAgr) => _idAgr = idAgr;
  String? get nomPrenom => _nomPrenom;
  set nomPrenom(String? nomPrenom) => _nomPrenom = nomPrenom;
  String? get email => _email;
  set email(String? email) => _email = email;
  int? get telephone => _telephone;
  set telephone(int? telephone) => _telephone = telephone;
  String? get residense => _residense;
  set residense(String? residense) => _residense = residense;
  int? get age => _age;
  set age(int? age) => _age = age;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get passWord => _passWord;
  set passWord(String? passWord) => _passWord = passWord;
  String? get passWordConfirm => _passWordConfirm;
  set passWordConfirm(String? passWordConfirm) =>
      _passWordConfirm = passWordConfirm;
  String? get activiteMenee => _activiteMenee;
  set activiteMenee(String? activiteMenee) => _activiteMenee = activiteMenee;

  Agriculteur.fromJson(Map<String, dynamic> json) {
    _idAgr = json['idAgr'];
    _nomPrenom = json['nomPrenom'];
    _email = json['email'];
    _telephone = json['telephone'];
    _residense = json['residense'];
    _age = json['age'];
    _image = json['image'];
    _passWord = json['passWord'];
    _passWordConfirm = json['passWordConfirm'];
    _activiteMenee = json['activiteMenee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idAgr'] = this._idAgr;
    data['nomPrenom'] = this._nomPrenom;
    data['email'] = this._email;
    data['telephone'] = this._telephone;
    data['residense'] = this._residense;
    data['age'] = this._age;
    data['image'] = this._image;
    data['passWord'] = this._passWord;
    data['passWordConfirm'] = this._passWordConfirm;
    data['activiteMenee'] = this._activiteMenee;
    return data;
  }
}
