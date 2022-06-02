import 'package:flutter/material.dart';
import 'package:flutter_massage/widget/navigator.dart';

class JobDetail extends StatefulWidget {
  const JobDetail({Key? key}) : super(key: key);

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
          ],
        ),
      ),
    );
  }
}
