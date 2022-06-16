import 'dart:convert';

import 'package:flutter_massage/config/constant.dart';

import '../model/job.dart';
import 'package:http/http.dart' as http;

class JobService {
  late List<Job> jobs = [];

  JobService() {
    Job job = Job();
    job.id = 1;
    job.name = "waa spa";
    job.time = "Full Time";
    job.detail =
        "Viverra mauris  aliquet. Integer elementum augue non suscipit interdum. Praesent mattis felis sit amet lacus varius dapibus in vel  eu in risus"
        "Viverra mauris  aliquet. Integer elementum augue non suscipit interdum. Praesent mattis felis sit amet lacus varius dapibus in vel  eu in risus"
        "Viverra mauris  aliquet. Integer elementum augue non suscipit interdum. Praesent mattis felis sit amet lacus varius dapibus in vel  eu in risus"
        "Viverra mauris  aliquet. Integer elementum augue non suscipit interdum. Praesent mattis felis sit amet lacus varius dapibus in vel  eu in risus"
        "Viverra mauris  aliquet. Integer elementum augue non suscipit interdum. Praesent mattis felis sit amet lacus varius dapibus in vel  eu in risus"
        "Viverra mauris  aliquet. Integer elementum augue non suscipit interdum. Praesent mattis felis sit amet lacus varius dapibus in vel  eu in risus";
    job.imageUrl =
        "https://thebest-edu.com/wp-content/uploads/2020/11/Switzerland-Scenery.jpeg";
    job.subName = "สวิตเซอร์แลด์";
    job.price = "49000";
    job.jobResponsibilities =
        "- Nam dapibus lacinia felis, in ultrices felis consectetur \n- Nullam quis odio eget met consectetur. Nullam ultrices.";

    jobs.add(job);

    job = Job();
    job.id = 2;
    job.name = "paaaaaa spa";
    job.time = "Part Time";
    job.subName = "อิตาลี";
    job.imageUrl =
        "https://thebest-edu.com/wp-content/uploads/2020/11/Switzerland-Scenery.jpeg";
    job.price = "32000";
    job.detail =
        "Viverra mauris  aliquet. Integer elementum augue non suscipit interdum. Praesent mattis felis sit amet lacus varius dapibus in vel  eu in risus";
    job.jobResponsibilities =
        "- Nam dapibus lacinia felis, in ultrices felis consectetur \n- Nullam quis odio eget met consectetur. Nullam ultrices.";

    jobs.add(job);

    job = Job();
    job.id = 3;
    job.name = "paaaaaa spa";
    job.time = "Full Time";
    job.subName = "อิตาลี";
    job.imageUrl =
        "https://thebest-edu.com/wp-content/uploads/2020/11/Switzerland-Scenery.jpeg";
    job.price = "32000";
    job.detail =
        "Viverra mauris  aliquet. Integer elementum augue non suscipit interdum. Praesent mattis felis sit amet lacus varius dapibus in vel  eu in risus";
    job.jobResponsibilities =
        "- Nam dapibus lacinia felis, in ultrices felis consectetur \n- Nullam quis odio eget met consectetur. Nullam ultrices.";

    jobs.add(job);

    job = Job();
    job.id = 4;
    job.imageUrl =
        "https://thebest-edu.com/wp-content/uploads/2020/11/Switzerland-Scenery.jpeg";
    job.name = "paaaaaa spa";
    job.time = "Part Time";
    job.subName = "อิตาลี";
    job.price = "32000";
    job.detail =
        "Viverra mauris  aliquet. Integer elementum augue non suscipit interdum. Praesent mattis felis sit amet lacus varius dapibus in vel  eu in risus";
    job.jobResponsibilities =
        "- Nam dapibus lacinia felis, in ultrices felis consectetur \n- Nullam quis odio eget met consectetur. Nullam ultrices.";

    jobs.add(job);
  }

  Future<List<Job>> getListJob() async {
    var response =
        await http.get(Uri.parse('${Constant.backendUrl}/api/jobs?populate=*'));

    if (response.statusCode == 200) {
      return convertAdvertiseResponseToObj(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
    }

    return [];
  }

  List<Job> convertAdvertiseResponseToObj(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    List<Job> ret = [];
    // print('data.length ${data.length}');
    for (var value in data) {
      Job job = Job();
      String name = value['attributes']['name'];
      String location = value['attributes']['location'];
      String price = value['attributes']['price'];
      String time = value['attributes']['time'];
      String detail = value['attributes']['detail'];
      String job_responsibilities = value['attributes']['job_responsibilities'];
      String image = value['attributes']['image']['data']['attributes']['url'];

      job.id = value['id'];
      job.name = name;
      job.time = time;
      job.detail = detail;
      job.imageUrl = '${Constant.backendUrl}${image}';
      job.subName = location;
      job.price = price;
      job.jobResponsibilities = job_responsibilities;

      ret.add(job);
    }
    return ret;
  }

  Job getById(int id) {
    return jobs.firstWhere((element) => element.id == id);
  }
}
