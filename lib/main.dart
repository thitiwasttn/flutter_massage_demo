import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_massage/routers.dart';
import 'package:flutter_massage/screen/home/home.dart';
import 'package:flutter_massage/screen/home_page/home_page.dart';
import 'package:flutter_massage/screen/home_page/home_page_v2.dart';
import 'package:flutter_massage/screen/job_detail/job_detail.dart';
import 'package:routemaster/routemaster.dart';

import 'navigator_route.dart';

void main() {
  runApp(const MyApp());
}

final routes = RouteMap(
  routes: {
    '/': (_) => MaterialPage(child: Home()),
    '/jobdetail/:jobId': (route) => MaterialPage(child: JobDetail(jobId: route.pathParameters['jobId'],)),
  },
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: MyCustomScrollBehavior(),
      routerDelegate: RoutemasterDelegate(routesBuilder: (_) => routes),
      routeInformationParser: RoutemasterParser(),
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
