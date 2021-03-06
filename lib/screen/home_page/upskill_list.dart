import 'package:flutter/material.dart';

import '../../model/upskill.dart';

class UpskillList extends StatefulWidget {
  const UpskillList({Key? key}) : super(key: key);

  @override
  State<UpskillList> createState() => _UpskillListState();
}

class _UpskillListState extends State<UpskillList> {
  late List<Upskill> upskill = [];

  @override
  void initState() {
    upskill.add(Upskill("images/kids.png", "นวดทารกและเด็ก"));
    upskill.add(Upskill("images/women.png", "นวดดูแลสุขภาพผู้หญิง"));
    upskill.add(Upskill("images/stuff.png", "นวดประคบอบสมุนไพร"));
    upskill.add(
        Upskill("images/kids.png", "นวด นวด นวดดดดดดดดดดดดดดดดดดดดดดดดดดด"));
  }

  getList() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    bool isMobile;
    if (w < 600) {
      isMobile = true;
    } else {
      isMobile = false;
    }
    return upskill
        .map(
          (e) => Container(
            padding: EdgeInsets.only(left: 14, right: 14),
            width: isMobile ? 200 : 300,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        e.imageUrl,
                        fit: BoxFit.fitHeight,
                        height: isMobile ? 100 : 130,
                        // color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        e.text,
                        style: TextStyle(
                          fontSize: isMobile ? 15 : 17,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    bool isMobile;
    if (w < 600) {
      // print('mobile');
      isMobile = true;
      // h = 200;
    } else {
      isMobile = false;
      // h = MediaQuery.of(context).size.height * 0.5;
      // print('desktop');
    }
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upskill",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "ดูทั้งหมด",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: isMobile ? 250 : 350,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: getList(),
            ),
          ),
        ],
      ),
    );
  }
}
