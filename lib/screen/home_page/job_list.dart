import 'package:flutter/material.dart';
import 'package:flutter_massage/model/job.dart';

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
    Job job = Job();
    job.name = "waa spa";
    job.imageUrl =
        "https://thebest-edu.com/wp-content/uploads/2020/11/Switzerland-Scenery.jpeg";
    job.subName = "สวิตเซอร์แลด์";
    job.price = "49000";
    jobs.add(job);

    job = Job();
    job.name = "paaaaaa spa";
    job.subName = "อิตาลี";
    job.imageUrl =
        "https://thebest-edu.com/wp-content/uploads/2020/11/Switzerland-Scenery.jpeg";
    job.price = "32000";

    jobs.add(job);

    job = Job();
    job.name = "paaaaaa spa";
    job.subName = "อิตาลี";
    job.imageUrl =
        "https://thebest-edu.com/wp-content/uploads/2020/11/Switzerland-Scenery.jpeg";
    job.price = "32000";

    jobs.add(job);

    job = Job();
    job.imageUrl =
        "https://thebest-edu.com/wp-content/uploads/2020/11/Switzerland-Scenery.jpeg";
    job.name = "paaaaaa spa";
    job.subName = "อิตาลี";
    job.price = "32000";

    jobs.add(job);
  }

  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    print(jobs);

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Job",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 350,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: jobs
                  .map(
                    (e) => Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // color: fromHex('#F8F8F8').withOpacity(0.7),
                            // border: Border.all(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          width: 300.0,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                                child: Image.network(
                                  e.imageUrl,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                                      // color: Colors.red,
                                      // width: 250,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.name,
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            e.subName,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            e.price + " THB/mount",
                                            style: TextStyle(
                                              fontSize: 20,
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
                                      padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            'images/saved.png',
                                            fit: BoxFit.fitHeight,
                                            height: 30,
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
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
