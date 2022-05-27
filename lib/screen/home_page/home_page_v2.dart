import 'package:flutter/material.dart';
import 'package:flutter_massage/screen/home_page/job_list.dart';

import 'carousel.dart';
import 'carousel_v2.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({Key? key}) : super(key: key);

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

  temp() {
    return Container(
      // color: Colors.blue,
      // width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.all(5),
      // margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                color: Colors.green,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  // width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  child: const Center(
                    child: Text("menu"),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Container(
                // color: fromHex('#1F5F3C'),
                /*decoration: BoxDecoration(
                  // color: Colors.yellow,
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),*/
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                  // width: MediaQuery.of(context).size.width * 0.6,
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Container(
                      // color: fromHex('#1F5F3C'),
                      // padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        color: fromHex('#1F5F3C'),
                        // border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      height: 500,
                      child: CarouselV2(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Container(
                color: Colors.green.shade300,
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
          SizedBox(height: 30),
          Row(
            children: [
              Container(
                color: Colors.pink,
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Container(
                      height: 300,
                      child: Text("Skills"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  temp2() {
    return Scaffold(
        body: ListView(
      // padding: const EdgeInsets.only(left: 40, right: 40),
      children: <Widget>[
        Container(
          color: Colors.green,
          width: MediaQuery.of(context).size.width * 1,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Center(
              child: Text("menu"),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          color: Colors.pink,
          width: MediaQuery.of(context).size.width * 1,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Container(
                height: 300,
                child: Text("image slider"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          color: Colors.green,
          width: MediaQuery.of(context).size.width * 1,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Container(
                height: 300,
                child: Text("Job list"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          color: Colors.pink,
          width: MediaQuery.of(context).size.width * 1,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Container(
                height: 300,
                child: Text("Up skill"),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      // padding: const EdgeInsets.only(left: 40, right: 40),
      children: <Widget>[
        temp(),
      ],
    ));
  }
}
