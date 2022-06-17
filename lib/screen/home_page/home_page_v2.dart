import 'package:flutter/material.dart';
import 'package:flutter_massage/screen/home_page/job_list.dart';
import 'package:flutter_massage/screen/home_page/upskill_list.dart';
import 'package:flutter_massage/screen/menu_bar.dart';

import '../../navigator_route.dart';
import 'carousel.dart';
import 'carousel_v2.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({Key? key}) : super(key: key);

  static Route<dynamic> route(bool animated) {
    return SimpleRoute(name: '/', title: 'Home', builder: (_) => HomePageV2(), animated: animated);
  }

  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> {
  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  bool isMobile(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    bool isMobile;
    if (w < 600) {
      isMobile = true;
    } else {
      isMobile = false;
    }
    return isMobile;
  }

  temp() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    if (w < 600) {
      h = 200;
    } else {
      h = MediaQuery.of(context).size.height * 0.5;
    }
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                  // padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      height: h,
                      child: CarouselV2(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: fromHex('#F8F8F8').withOpacity(0.7),
                      // border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    // height: 450,
                    width: MediaQuery.of(context).size.width * 1,
                    child: JobList(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                // color: fromHex("F8F8F8"),
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: fromHex('#F8F8F8').withOpacity(0.7),
                      // border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    // height: 450,
                    width: MediaQuery.of(context).size.width * 1,
                    child: UpskillList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return temp();
  }
}
