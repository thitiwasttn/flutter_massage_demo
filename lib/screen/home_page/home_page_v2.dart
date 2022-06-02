import 'package:flutter/material.dart';
import 'package:flutter_massage/screen/home_page/job_list.dart';
import 'package:flutter_massage/screen/home_page/upskill_list.dart';
import 'package:flutter_massage/screen/menu_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../utils/content_view.dart';
import '../../utils/tab_controller_handler.dart';
import '../../widget/custom_tab.dart';
import '../../widget/custom_tab_bar.dart';
import 'carousel.dart';
import 'carousel_v2.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({Key? key}) : super(key: key);

  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ItemScrollController itemScrollController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double bottomPadding;
  late double sidePadding;

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  Widget temp() {
    return Container(
      color: Colors.grey.shade200,
      // width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.all(5),
      // margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
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
                        // color: fromHex('#1F5F3C'),
                        // border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      // height: 300,
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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    itemScrollController = ItemScrollController();
  }

  List<ContentView> contentViews = [
    ContentView(
      tab: CustomTab(title: 'Home'),
      content: temp(),
    ),
    ContentView(
      tab: CustomTab(title: 'About'),
      content: Text("About"),
    ),
    ContentView(
      tab: CustomTab(title: 'Projects'),
      content: Text("Projects"),
    )
  ];

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /// Tab Bar
        Container(
          height: screenHeight * 0.05,
          child: CustomTabBar(
              controller: tabController,
              tabs: contentViews.map((e) => e.tab).toList()),
        ),

        /// Tab Bar View
        Container(
          height: screenHeight * 0.8,
          child: TabControllerHandler(
            tabController: tabController,
            child: TabBarView(
              controller: tabController,
              children: contentViews.map((e) => e.content).toList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;
    return Scaffold(
        // bottomNavigationBar: MenuBar(),
        body: ListView(
      // padding: const EdgeInsets.only(left: 40, right: 40),
      children: <Widget>[
        desktopView(),
        temp(),
      ],
    ));
  }
}
