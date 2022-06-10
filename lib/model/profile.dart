class Profile {
  late int _id;
  late String token;
  late String _name;
  late String _imageUrl;

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