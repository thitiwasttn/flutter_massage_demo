import 'package:flutter/material.dart';
import 'package:flutter_massage/screen/home_page/home_page_v2.dart';
import 'package:flutter_massage/widget/navigator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildDeskTop(),
    );
  }

  Widget buildDeskTop() {
    return Container(
      child: ListView(
        children: [
          NavigatorCustom(),
          HomePageV2(),
        ],
      ),
    );
  }
}
