import 'package:flutter/material.dart';
import 'package:flutter_massage/screen/home_page/home_page_v2.dart';
import 'package:flutter_massage/screen/job_detail/job_detail.dart';

class NavigatorRoute extends StatefulWidget {
  final String? path;

  static Route<dynamic> route(String? path) {
    return SimpleRoute(
        name: '', // this one is always empty as you didn't route yet
        title: 'Website Title',
        builder: (_) => NavigatorRoute(path: path),
        animated: false);
  }

  const NavigatorRoute({Key? key, required this.path}) : super(key: key);

  @override
  _NavigatorRouteState createState() => _NavigatorRouteState();
}

class _NavigatorRouteState extends State<NavigatorRoute> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      print('widget.path : ${widget.path}');
      if (widget.path == '/') {
        Navigator.of(context)
            .pushAndRemoveUntil(HomePageV2.route(false), (_) => false);
        return;
      } else if (widget.path == '/jobdetail') {
        Navigator.of(context)
            .pushAndRemoveUntil(JobDetail.route(false), (_) => false);
        return;
      } else if (widget.path!.contains('/jobdetail/')) {
        Navigator.of(context).pushAndRemoveUntil(JobDetail.routeCode(widget.path!.split('/')[2]), (_) => false);
        return;
      } else {
        Navigator.of(context)
              .pushAndRemoveUntil(HomePageV2.route(false), (_) => false);
          return;
      }
      // else if (widget.path == '/user') {
      //   Navigator.of(context)
      //       .pushAndRemoveUntil(UserScreen.route(false), (_) => false);
      //   return;
      // } else if (widget.path.contains('/user/')) {
      //   Navigator.of(context).pushAndRemoveUntil(
      //       UserScreen.routeCode(widget.path.split('/')[2]), (_) => false);
      //   return;
      // } else if (widget.path == '/about') {
      //   Navigator.of(context)
      //       .pushAndRemoveUntil(AboutScreen.route(), (_) => false);
      //   return;
      // } else {
      //   Navigator.of(context)
      //       .pushAndRemoveUntil(HomeScreen.route(), (_) => false);
      //   return;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}

class SimpleRoute extends PageRoute {
  SimpleRoute({required String name, required this.title, required this.builder, required this.animated})
      : super(settings: RouteSettings(name: name));

  final String title;
  final WidgetBuilder builder;

  final bool animated;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return animated
        ? FadeTransition(
      opacity: animation,
      child: Title(
        title: this.title,
        color: Theme.of(context).primaryColor,
        child: builder(context),
      ),
    )
        : Title(
      title: this.title,
      color: Theme.of(context).primaryColor,
      child: builder(context),
    );
  }
}
