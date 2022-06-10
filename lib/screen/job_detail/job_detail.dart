import 'package:flutter/material.dart';
import 'package:flutter_massage/model/job.dart';
import 'package:flutter_massage/service/job_service.dart';
import 'package:flutter_massage/widget/navigator.dart';

import '../../navigator_route.dart';
import '../home_page/home_page_v2.dart';

class JobDetail extends StatefulWidget {
  final String? jobId;

  const JobDetail({Key? key, this.jobId}) : super(key: key);

  static Route<dynamic> route(bool animated) {
    return SimpleRoute(
        name: '/jobdetail',
        title: 'job detail',
        builder: (_) => JobDetail(),
        animated: animated);
  }

  static Route<dynamic> routeCode(String? jobId) {
    return SimpleRoute(
        name: '/jobdetail/$jobId',
        title: 'User',
        builder: (_) => JobDetail(jobId: jobId),
        animated: false);
  }

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  late Job job;
  late int pageState = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            NavigatorCustom(),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextButton(
                        /*style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),*/
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            Image.asset('images/back.png'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Back'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 300.0,
                          height: 300.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(job.imageUrl)))),
                    ],
                  ),
                  // color: Colors.green,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  // color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        job.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Image.asset(
                          'images/saved.png',
                          fit: BoxFit.fitHeight,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset(
                          'images/location.png',
                          fit: BoxFit.fitHeight,
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        job.subName,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [],
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          job.time,
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [],
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Onsite",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [],
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${job.price} / Mounth',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  // color: Colors.grey,
                  child: Row(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        /*style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),*/
                        onPressed: () {
                          setState(() {
                            pageState = 1;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: getBoxDesc(),
                          child: Text(
                            'Descripion',
                            style: getTextStyle(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        /*style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),*/
                        onPressed: () {
                          setState(() {
                            pageState = 2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: getBoxCompany(),
                          child: Text(
                            'Company',
                            style: getTextStyleCompany(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // color: Colors.white,
              child: getMessage(),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                /*style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),*/
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: 400,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff1F5F3C),
                    boxShadow: [],
                  ),
                  child: Text(
                    'Apply Now',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    JobService jobService = JobService();
    job = jobService.getById(int.parse(widget.jobId!));
  }

  Widget getMessage() {
    if (pageState == 1) {
      return Container(
        padding: EdgeInsets.only(left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About This Job",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              job.detail,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Job Responsibilities",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              job.jobResponsibilities,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  BoxDecoration getBoxDesc() {
    if (pageState == 1) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffddb63f),
        boxShadow: [],
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: Colors.white,
        boxShadow: [],
      );
    }
  }

  BoxDecoration getBoxCompany() {
    if (pageState == 2) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffddb63f),
        boxShadow: [],
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: Colors.white,
        boxShadow: [],
      );
    }
  }

  TextStyle getTextStyle() {
    if (pageState == 1) {
      return const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
    } else {
      return const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey);
    }
  }

  TextStyle getTextStyleCompany() {
    if (pageState == 2) {
      return const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
    } else {
      return const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey);
    }
  }
}
