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
                          width: 400.0,
                          height: 400.0,
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
                  color: Colors.grey,
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
                )
              ],
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
}
