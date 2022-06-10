class Profile {
  late int _id;
  late String _token;
  late String _name;
  late String _imageUrl;


  String get token => _token;

  set token(String value) {
    _token = value;
  }

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