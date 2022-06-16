import 'dart:convert';

import 'package:flutter_massage/config/constant.dart';
import 'package:flutter_massage/model/profile.dart';
import 'package:flutter_massage/model/profile_info.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  ProfileInfo getProfileInfoByToken(String token) {
    ProfileInfo profileInfo = ProfileInfo();
    if (token == '1234') {
      profileInfo.education =
          "- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed\n- Lorem ipsum dolor sit ";
      profileInfo.experience =
          "- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed\n- Lorem ipsum dolor sit ";
      profileInfo.skill =
          "- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed\n- Lorem ipsum dolor sit ";
      List<String> images = [];
      images.add(
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/certificate-of-appreciation-design-template-c46b6dc447f94b068a04728bd695cc4c_screen.jpg?ts=1608659484");
      images.add(
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/certificate-of-appreciation-design-template-c46b6dc447f94b068a04728bd695cc4c_screen.jpg?ts=1608659484");
      images.add(
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/certificate-of-appreciation-design-template-c46b6dc447f94b068a04728bd695cc4c_screen.jpg?ts=1608659484");
      profileInfo.certifications.addAll(images);
      profileInfo.objective =
          "- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ";
    }

    return profileInfo;
  }

  Future<Profile> login(String username, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('${Constant.backendUrl}/api/auth/local?populate=*'));
    request.body =
        json.encode({"identifier": "${username}", "password": "${password}"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return convertAdvertiseResponseToObj(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.reasonPhrase);
    }

    return Profile();
  }

  Future<Profile> convertAdvertiseResponseToObj(
      Map<String, dynamic> json) async {
    var user = json['user'];
    Profile profile = Profile();
    print('data >> ${user}');
    profile.name = user['name'];
    profile.token = json['jwt'];
    profile.imageUrl =
        await getProfile(user['id'], profile.token).then((value) {
      return value.image;
    });

    // for (var value in data) {
    //   String image = value['attributes']['image']['data']['attributes']['url'];
    //   // print('image >> ${image}');
    //   // ret.add('${Constant.backendUrl}${image}');
    // }
    // String temp = data['attributes']['image']['data']['attributes']['url'];
    return profile;
  }

  Future<ProfileInfo> getProfile(int userId, String token) async {
    ProfileInfo profileInfo = ProfileInfo();
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${Constant.backendUrl}/api/profile-infos?filters[users_permissions_user][id][\$eq]=$userId&populate=*'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return convertProfileInfoResponseToObj(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.reasonPhrase);
    }

    return profileInfo;
  }

  ProfileInfo convertProfileInfoResponseToObj(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    ProfileInfo ret = ProfileInfo();
    for (var value in data) {
      ret.image =
          '${Constant.backendUrl}${value['attributes']['avatar']['data']['attributes']['url']}';
      ret.education = value['attributes']['education'];
      ret.experience = value['attributes']['experience'];
      ret.skill = value['attributes']['skill'];
      ret.certifications = [];
      List<dynamic> temp = value['attributes']['certification']['data'];
      for (var value1 in temp) {
        String img = value1['attributes']['url'];
        ret.certifications.add(img);
      }
    }
    return ret;
  }
}
