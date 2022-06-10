import 'package:flutter_massage/model/profile_info.dart';

class ProfileService {

  ProfileInfo getProfileInfoByToken(String token) {
    ProfileInfo profileInfo = ProfileInfo();
    profileInfo.education = "- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed\n- Lorem ipsum dolor sit ";
    profileInfo.experience = "- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed\n- Lorem ipsum dolor sit ";
    profileInfo.skill = "- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed\n- Lorem ipsum dolor sit ";
    List<String> images = [];
    images.add("https://d1csarkz8obe9u.cloudfront.net/posterpreviews/certificate-of-appreciation-design-template-c46b6dc447f94b068a04728bd695cc4c_screen.jpg?ts=1608659484");
    images.add("https://d1csarkz8obe9u.cloudfront.net/posterpreviews/certificate-of-appreciation-design-template-c46b6dc447f94b068a04728bd695cc4c_screen.jpg?ts=1608659484");
    images.add("https://d1csarkz8obe9u.cloudfront.net/posterpreviews/certificate-of-appreciation-design-template-c46b6dc447f94b068a04728bd695cc4c_screen.jpg?ts=1608659484");
    profileInfo.certifications.addAll(images);
    profileInfo.objective = "- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ";
    return profileInfo;
  }
}