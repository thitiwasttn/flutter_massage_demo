import 'package:flutter/material.dart';
import 'package:flutter_massage/model/profile.dart';
import 'package:flutter_massage/model/profile_info.dart';
import 'package:flutter_massage/service/profile_service.dart';
import 'package:localstorage/localstorage.dart';
import 'package:routemaster/routemaster.dart';

import '../../utils/my_provider.dart';
import '../../utils/shared_object.dart';
import '../../widget/navigator.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  late ProfileInfo profileInfo;
  late SharedObject sharedObject;
  ProfileService profileService = ProfileService();
  final LocalStorage storage = LocalStorage('some_key');
  late Profile profile;

  @override
  void initState() {
    super.initState();
    loadIntem();
  }

  loadIntem() async {
    bool isready = await storage.ready;
    print("isready ${isready}");
    if (isready) {
      print("ok");
      if (storage.getItem("isLogin") != null && storage.getItem("isLogin")) {
        setState(() {
          profile = new Profile();
          profile.imageUrl = storage.getItem("imageUrl");
          profileInfo =
              profileService.getProfileInfoByToken(storage.getItem("token"));
          print('profileInfo ${profileInfo.skill}');
        });
      } else {
        Routemaster.of(context).push('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data == null) {
            return Container();
          }

          return Container(
            child: ListView(
              children: [
                NavigatorCustom(),
                Container(
                  margin: EdgeInsets.only(left: 50, right: 50),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            child: TextButton(
                              style: ButtonStyle(
                                overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: () {
                                Routemaster.of(context).pop();
                              },
                              child: Row(
                                children: [
                                  Image.asset('images/back.png'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Back',
                                    style: TextStyle(
                                        color: Color(0x1ff1F5F3C),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 30,
                          bottom: 30,
                          left: 5,
                          right: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [],
                          color: Colors.white,
                        ),
                        child: getInfo(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget getInfo(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(profile.imageUrl),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        education(context),
        const SizedBox(
          height: 30,
        ),
        experience(context),
        const SizedBox(
          height: 30,
        ),
        skill(context),
        const SizedBox(
          height: 30,
        ),
        certification(context),
        const SizedBox(
          height: 30,
        ),
        objective(context)
      ],
    );
  }

  Text textEducation() {
    return Text(
      profileInfo.education,
      style: const TextStyle(color: Color(0x1ff50555C), fontSize: 25),
    );
  }

  Text textExperience() {
    return Text(
      profileInfo.experience,
      style: const TextStyle(color: Color(0x1ff50555C), fontSize: 25),
    );
  }

  Text textSkill() {
    return Text(
      profileInfo.skill,
      style: const TextStyle(color: Color(0x1ff50555C), fontSize: 25),
    );
  }

  Text textObjective() {
    return Text(
      profileInfo.objective,
      style: const TextStyle(color: Color(0x1ff50555C), fontSize: 25),
    );
  }

  education(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: const Text(
                      "การศึกษา",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0x1ff50555C),
                          fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(left: 60),
            child: textEducation(),
          ),
        ],
      ),
    );
  }

  experience(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: const Text(
                      "ประสบการณ์",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0x1ff50555C),
                          fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(left: 60),
            child: textExperience(),
          ),
        ],
      ),
    );
  }

  skill(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: const Text(
                      "ทักษะ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0x1ff50555C),
                          fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(left: 60),
            child: textSkill(),
          ),
        ],
      ),
    );
  }

  certification(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: const Text(
                      "ใบรับรอง",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0x1ff50555C),
                          fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              alignment: WrapAlignment.spaceBetween,
              children: profileInfo.certifications
                  .map(
                    (e) => Image.network(
                      e,
                      fit: BoxFit.fitWidth,
                      width: 300,
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  objective(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: const Text(
                      "งานที่สนใจ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0x1ff50555C),
                          fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(left: 60),
            child: textObjective(),
          ),
        ],
      ),
    );
  }
}
