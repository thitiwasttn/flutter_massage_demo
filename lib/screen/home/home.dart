import 'package:flutter/material.dart';
import 'package:flutter_massage/screen/home_page/home_page_v2.dart';
import 'package:flutter_massage/widget/navigator.dart';
import 'package:localstorage/localstorage.dart';

import '../../utils/my_provider.dart';
import '../../utils/shared_object.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final LocalStorage storage = LocalStorage('some_key');

  @override
  Widget build(BuildContext context) {
    SharedObject sharedObject = MyProvider.of(context);
    return Scaffold(
      body: buildDeskTop(),
    );
  }

  Widget buildDeskTop() {
    return FutureBuilder(
      future: storage.ready,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          child: ListView(
            children: [
              NavigatorCustom(),
              HomePageV2(),
            ],
          ),
        );
      },
    );
  }
}
