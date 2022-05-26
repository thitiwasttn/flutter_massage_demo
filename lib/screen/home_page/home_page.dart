import 'package:flutter/material.dart';
import 'package:flutter_massage/screen/home_page/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl =
      "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80";

  imageComponent() {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.fill,
            width: 1000,
            height: 300,
          ),
          SizedBox(
            height: 40,
            width: 1000,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                    width: 1000,
                    height: 300,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Card(
                    child: SizedBox(
                      width: 1000,
                      height: 500,
                      child: Center(child: Text('Elevated Card')),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
