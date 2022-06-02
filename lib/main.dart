import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_massage/routers.dart';
import 'package:flutter_massage/screen/home/home.dart';
import 'package:flutter_massage/screen/home_page/home_page.dart';
import 'package:flutter_massage/screen/home_page/home_page_v2.dart';
import 'package:flutter_massage/screen/menu_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: routers,
      scrollBehavior: MyCustomScrollBehavior(),
      home: Scaffold(
        body: Home(),
        // bottomNavigationBar: MenuBar(),
      )
    );
  }
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}