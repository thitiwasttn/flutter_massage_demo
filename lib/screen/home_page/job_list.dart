import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_massage/model/job.dart';
import 'package:flutter_massage/service/job_service.dart';
import 'package:routemaster/routemaster.dart';

class JobList extends StatefulWidget {
  const JobList({Key? key}) : super(key: key);

  @override
  State<JobList> createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  late List<Job> jobs = [];
  String nameTest = "";

  @override
  void initState() {
    JobService jobService = JobService();
    jobService.getListJob().then((value) {
      setState(() {
        jobs = value;
      });
    });
  }

  final ScrollController controller = ScrollController();

  getJobList() {
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
    return jobs
        .map(
          (e) => Row(
            children: [
              InkWell(
                onTap: () {
                  //Navigator.pushNamed(context, '/jobdetail/${e.id}');
                  Routemaster.of(context).push('/jobdetail/${e.id}');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  width: isMobile ? 200 : 300,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                        child: Image.network(
                          e.imageUrl,
                          fit: BoxFit.cover,
                          height: isMobile ? 100 : 200,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              padding:
                                  EdgeInsets.only(top: 10, right: 20, left: 20),
                              // color: Colors.red,
                              // width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.name,
                                    style: TextStyle(
                                        fontSize: isMobile ? 15 : 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    e.subName,
                                    style: TextStyle(
                                      fontSize: isMobile ? 15 : 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    e.price + " THB/mount",
                                    style: TextStyle(
                                      fontSize: isMobile ? 15 : 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              // color: Colors.green,
                              // width: 300,
                              padding:
                                  EdgeInsets.only(top: 10, right: 20, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    'images/saved.png',
                                    fit: BoxFit.fitHeight,
                                    height: isMobile ? 15 : 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // print(jobs);
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
                "New Job",
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
              children: getJobList(),
            ),
          ),
        ],
      ),
    );
  }
}
