class Job {
  int _id = 0;
  String _name = "";
  String _imageUrl ="";
  String _subName = "";
  String _price = "";
  String _time = "";
  String _detail = "";
  String _jobResponsibilities = "";


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

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get time => _time;

  set time(String value) {
    _time = value;
  }

  String get detail => _detail;

  set detail(String value) {
    _detail = value;
  }

  String get jobResponsibilities => _jobResponsibilities;

  set jobResponsibilities(String value) {
    _jobResponsibilities = value;
  }
}
