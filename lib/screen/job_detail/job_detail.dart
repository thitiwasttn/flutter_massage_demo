import 'package:flutter/material.dart';
import 'package:flutter_massage/widget/navigator.dart';

import '../../navigator_route.dart';
import '../home_page/home_page_v2.dart';

class JobDetail extends StatefulWidget {
  final String? jobId;
  const JobDetail({Key? key, this.jobId}) : super(key: key);
  static Route<dynamic> route(bool animated) {
    return SimpleRoute(name: '/jobdetail', title: 'job detail', builder: (_) => JobDetail(), animated: animated);
  }

  static Route<dynamic> routeCode(String? jobId) {
    return SimpleRoute(name: '/jobdetail/$jobId', title: 'User', builder: (_) => JobDetail(jobId: jobId), animated: false);
  }

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            NavigatorCustom(),
            Text('${widget.jobId}')
          ],
        ),
      ),
    );
  }

}
