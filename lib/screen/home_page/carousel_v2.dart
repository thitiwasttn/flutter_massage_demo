import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_massage/service/home_service.dart';



class CarouselV2 extends StatefulWidget {
  const CarouselV2({Key? key}) : super(key: key);

  @override
  State<CarouselV2> createState() => _CarouselV2State();
}


class _CarouselV2State extends State<CarouselV2> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  late List<String> imgList = [];
  final HomeService homeService = HomeService();

  @override
  void initState() {
    homeService.getAdvertise().then((value) {
      setState((){
        imgList = value;
      });
    });

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Colors.red,
      child: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imgList
                .map((item) => Container(
                      child: Container(
                        // margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                  item,
                                  fit: BoxFit.fitWidth,
                                  width: MediaQuery.of(context).size.width,
                                  // height: 300,
                                ),
                              ],
                            )),
                      ),
                    ))
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Color.fromARGB(221, 182, 63, 1))
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
