class ProfileInfo {
  String _education = "";
  String _experience = "";
  String _skill = "";
  List<String> _certifications = [];
  String _objective = "";
  String _image = "";


  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get education => _education;

  set education(String value) {
    _education = value;
  }

  String get experience => _experience;

  String get objective => _objective;

  set objective(String value) {
    _objective = value;
  }

  List<String> get certifications => _certifications;

  set certifications(List<String> value) {
    _certifications = value;
  }

  String get skill => _skill;

  set skill(String value) {
    _skill = value;
  }

  set experience(String value) {
    _experience = value;
  }
}