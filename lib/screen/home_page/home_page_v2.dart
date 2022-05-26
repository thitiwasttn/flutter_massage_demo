import 'package:flutter/material.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({Key? key}) : super(key: key);

  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.green,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Container(
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
                  color: Colors.pink,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child:  Center(
                      child: Container(
                        height: 300,
                        child: Text("image slider"),
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
                  color: Colors.pink,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child:  Center(
                      child: Container(
                        height: 300,
                        child: Text("Job list"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
