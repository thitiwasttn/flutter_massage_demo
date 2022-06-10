class ProfileInfo {
  late String _education;
  late String _experience;
  late String _skill;
  late List<String> _certifications = [];
  late String _objective;

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