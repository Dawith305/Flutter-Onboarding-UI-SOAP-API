class OnBoardingPageModel {

  String _title;
  String _description;
  String _imgPath;

  OnBoardingPageModel(this._title, this._description, this._imgPath);

  String get imgPath => _imgPath;

  set imgPath(String value) {
    _imgPath = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

}