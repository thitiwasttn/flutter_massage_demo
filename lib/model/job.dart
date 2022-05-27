class Job {


  late String _name;
  late String _imageUrl;
  late String _subName;
  late String _price;


  Job();

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get imageUrl => _imageUrl;

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  String get subName => _subName;

  set subName(String value) {
    _subName = value;
  }

  set imageUrl(String value) {
    _imageUrl = value;
  }
}
