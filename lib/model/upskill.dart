class Upskill {
  String _imageUrl;
  String _text;


  Upskill(this._imageUrl, this._text);

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  String get text => _text;

  set text(String value) {
    _text = value;
  }
}