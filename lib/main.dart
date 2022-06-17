import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_massage/config/constant.dart';
import 'package:flutter_massage/model/profile_info.dart';
import 'package:flutter_massage/routers.dart';
import 'package:flutter_massage/screen/home/home.dart';
import 'package:flutter_massage/screen/home_page/home_page.dart';
import 'package:flutter_massage/screen/home_page/home_page_v2.dart';
import 'package:flutter_massage/screen/job_detail/job_detail.dart';
import 'package:flutter_massage/screen/login/login_page.dart';
import 'package:flutter_massage/screen/profile/profile_page.dart';
import 'package:flutter_massage/screen/resume/resume_page.dart';
import 'package:flutter_massage/utils/my_provider.dart';
import 'package:flutter_massage/utils/shared_object.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


import 'navigator_route.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  print('backend url ${Constant.backendUrl}');
  runApp(const MyApp());
}

final routes = RouteMap(
  routes: {
    '/': (_) => MaterialPage(child: Home()),
    '/jobdetail/:jobId': (route) => MaterialPage(child: JobDetail(jobId: route.pathParameters['jobId'],)),
    '/profile': (_) => MaterialPage(child: ProfilePage()),
    '/profile/resume': (_) => MaterialPage(child: ResumePage()),
    '/login': (_) => MaterialPage(child: LoginPage()),
  },
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyProvider(
      sharedObject: SharedObject(),
      child: MaterialApp.router(
        scrollBehavior: MyCustomScrollBehavior(),
        routerDelegate: RoutemasterDelegate(routesBuilder: (_) => routes),
        routeInformationParser: RoutemasterParser(),
      ),
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
