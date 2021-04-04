class Country {
  String _name;
  String _code;
  String _flag;
  String _capitalCity;
  String _currency;


  Country(this._name, this._code, this._flag, this._capitalCity,
      this._currency);

  String get name => _name;

  set name(String value) {
    _name = value;
  }


  String get code => _code;

  set code(String value) {
    _code = value;
  }

  String get flag => _flag;

  set flag(String value) {
    _flag = value;
  }

  String get capitalCity => _capitalCity;

  set capitalCity(String value) {
    _capitalCity = value;
  }

  String get currency => _currency;

  set currency(String value) {
    _currency = value;
  }

}