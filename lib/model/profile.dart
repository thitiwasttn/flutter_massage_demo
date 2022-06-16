class Profile {
  int _id = 0;
  String token = "";
  String _name = "";
  String _imageUrl = "";

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}