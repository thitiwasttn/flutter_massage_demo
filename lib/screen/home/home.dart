import 'package:flutter/material.dart';
import 'package:flutter_massage/screen/home_page/home_page_v2.dart';
import 'package:flutter_massage/widget/navigator.dart';

import '../../utils/my_provider.dart';
import '../../utils/shared_object.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SharedObject sharedObject = MyProvider.of(context);
    sharedObject.profile.id = 1;
    sharedObject.profile.name = "Thitiwas Nupan";
    sharedObject.profile.imageUrl = "https://static.independent.co.uk/s3fs-public/thumbnails/image/2015/06/06/15/Chris-Pratt.jpg?quality=75&width=982&height=726&auto=webp";

    print('sharedObject: ${sharedObject.profile.name}');
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
