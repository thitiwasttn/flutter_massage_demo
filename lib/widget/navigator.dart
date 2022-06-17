import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:routemaster/routemaster.dart';

import '../utils/my_provider.dart';
import '../utils/shared_object.dart';

class NavigatorCustom extends StatefulWidget {
  const NavigatorCustom({Key? key}) : super(key: key);

  @override
  State<NavigatorCustom> createState() => _NavigatorCustomState();
}

class _NavigatorCustomState extends State<NavigatorCustom> {
  final LocalStorage storage = LocalStorage('some_key');

  @override
  Widget build(BuildContext context) {
    SharedObject sharedObject = MyProvider.of(context);
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 70,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                Routemaster.of(context).push('/');
              },
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset('images/Home_duotone.png'),
                  Text(
                    "หน้าแรก",
                    style: TextStyle(
                      color: Color(0xff8E8E93),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 70,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset('images/Search_alt_duotone_line.png'),
                  Text(
                    "ค้นหา",
                    style: TextStyle(
                      color: Color(0xff8E8E93),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 70,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset('images/Box.png'),
                  Text(
                    "แฟ้มงาน",
                    style: TextStyle(
                      color:Color(0xff8E8E93),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                print(
                    'storage.getItem("isLogin") == Null ${storage.getItem("isLogin") == null}');
                if (storage.getItem("isLogin") == null ||
                    !storage.getItem("isLogin")) {
                  Routemaster.of(context).push('/login');
                } else {
                  Routemaster.of(context).push('/profile');
                }
              },
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset('images/User.png'),
                  Text(
                    "ข้อมูลส่วนตัว",
                    style: TextStyle(
                      color: Color(0xff8E8E93),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
