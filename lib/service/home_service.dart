import 'dart:convert';

import 'package:flutter_massage/config/constant.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<List<String>> getAdvertise() async {
    print('getAdvertise()');
    List<String> ret = [];
    var response = await http
        .get(Uri.parse('${Constant.backendUrl}/api/advertises?populate=*'));

    if (response.statusCode == 200) {
      ret = convertAdvertiseResponseToObj(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
    }
    return ret;
  }

  List<String> convertAdvertiseResponseToObj(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    List<String> ret = [];
    print('data.length ${data.length}');
    for (var value in data) {
      String image = value['attributes']['image']['data']['attributes']['url'];
      print('image >> ${image}');
      ret.add('${Constant.backendUrl}${image}');
    }
    // String temp = data['attributes']['image']['data']['attributes']['url'];
    return ret;
  }
}
