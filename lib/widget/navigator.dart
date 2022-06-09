import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class NavigatorCustom extends StatefulWidget {
  const NavigatorCustom({Key? key}) : super(key: key);

  @override
  State<NavigatorCustom> createState() => _NavigatorCustomState();
}

class _NavigatorCustomState extends State<NavigatorCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 100,
            child: TextButton(
              onPressed: () {
                Routemaster.of(context).push('/');
              },
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset('images/Home_duotone.png'),
                  Text("หน้าแรก"),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset('images/Search_alt_duotone_line.png'),
                  Text("ค้นหา"),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset('images/Box.png'),
                  Text("แฟ้มงาน"),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset('images/User.png'),
                  Text("ข้อมูลส่วนตัว"),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }
}
