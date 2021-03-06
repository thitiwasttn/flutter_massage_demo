import 'package:flutter/material.dart';
import 'package:flutter_massage/model/profile.dart';
import 'package:localstorage/localstorage.dart';
import 'package:routemaster/routemaster.dart';

import '../../model/profile_info.dart';
import '../../utils/my_provider.dart';
import '../../utils/shared_object.dart';
import '../../widget/navigator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final LocalStorage storage = LocalStorage('some_key');
  late Profile profile;
  bool initialized = false;
  late bool isLogin;
  late ProfileInfo profileInfo;

  @override
  void initState() {
    loadIntem();
  }

  loadIntem() async {
    bool isready = await storage.ready;
    print("isready ${isready}");
    if (isready) {
      print("ok");
      if (storage.getItem("isLogin") != null && storage.getItem("isLogin")) {
        isLogin = storage.getItem("isLogin");
        profile = Profile();
        setState(() {
          profile.name = storage.getItem("name");
          profile.imageUrl = storage.getItem('imageUrl');
        });
      } else {
        Routemaster.of(context).push('/login');
      }
    }
  }

  bool isMobile(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    bool isMobile;
    if (w < 600) {
      isMobile = true;
    } else {
      isMobile = false;
    }
    return isMobile;
  }

  @override
  Widget build(BuildContext context) {
    SharedObject sharedObject = MyProvider.of(context);
    // loadIntem();
    return Scaffold(
      body: FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // loadIntem();
          // print('profile ${profile}');
          return Column(
            children: [
              Container(
                height: isMobile(context)
                    ? MediaQuery.of(context).size.height - 100
                    : MediaQuery.of(context).size.height,
                child: ListView(
                  children: [
                    isMobile(context) ? Container() : NavigatorCustom(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: isMobile(context)
                          ? EdgeInsets.only(left: 10, right: 10)
                          : EdgeInsets.only(left: 50, right: 50),
                      // color: Colors.grey,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'images/Subtract.png',
                            fit: BoxFit.fitHeight,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(profile.imageUrl),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            profile.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: isMobile(context)
                          ? EdgeInsets.only(
                              left: 10,
                              right: 10,
                            )
                          : EdgeInsets.only(
                              left: 50,
                              right: 50,
                            ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [],
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "???????????????????????????????????????",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: isMobile(context)
                          ? EdgeInsets.only(
                              left: 10,
                              right: 10,
                            )
                          : EdgeInsets.only(
                              left: 50,
                              right: 50,
                            ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [],
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "????????????????????????",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: isMobile(context)
                          ? EdgeInsets.only(
                              left: 10,
                              right: 10,
                            )
                          : EdgeInsets.only(
                              left: 50,
                              right: 50,
                            ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [],
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "?????????????????????????????????????????????",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: isMobile(context)
                          ? EdgeInsets.only(
                              left: 10,
                              right: 10,
                            )
                          : EdgeInsets.only(
                              left: 50,
                              right: 50,
                            ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [],
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "???????????????",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: isMobile(context)
                          ? EdgeInsets.only(
                              left: 10,
                              right: 10,
                            )
                          : EdgeInsets.only(
                              left: 50,
                              right: 50,
                            ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [],
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "????????????????????????",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: isMobile(context)
                          ? EdgeInsets.only(
                              left: 10,
                              right: 10,
                            )
                          : EdgeInsets.only(
                              left: 50,
                              right: 50,
                            ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [],
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "?????????????????????????????????????????????????????????",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: isMobile(context)
                          ? EdgeInsets.only(
                              left: 10,
                              right: 10,
                            )
                          : EdgeInsets.only(
                              left: 50,
                              right: 50,
                            ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [],
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "??????????????????????????????",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: isMobile(context)
                          ? EdgeInsets.only(
                              left: 10,
                              right: 10,
                            )
                          : EdgeInsets.only(
                              left: 50,
                              right: 50,
                            ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
                              Routemaster.of(context).push('/profile/resume');
                            },
                            child: Container(
                                padding: EdgeInsets.only(
                                  top: 6,
                                  bottom: 6,
                                  right: 10,
                                  left: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [],
                                  border: Border.all(
                                    color: Color(0x1ff1F5F3C),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'images/View_alt.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    Text(
                                      'preview resume',
                                      style: TextStyle(
                                        color: Color(0x1ff1F5F3C),
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: isMobile(context)
                          ? EdgeInsets.only(
                              left: 10,
                              right: 10,
                            )
                          : EdgeInsets.only(
                              left: 50,
                              right: 50,
                            ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
                              setState(() {
                                storage.setItem('isLogin', false);
                              });
                              Routemaster.of(context).push('/login');
                            },
                            child: Container(
                                padding: EdgeInsets.only(
                                  top: 6,
                                  bottom: 6,
                                  right: 10,
                                  left: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [],
                                  border: Border.all(
                                    color: Color(0x1ff1F5F3C),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    /*Image.asset(
                                      'images/View_alt.png',
                                      width: 30,
                                      height: 30,
                                    ),*/
                                    Text(
                                      'logout'.toUpperCase(),
                                      style: TextStyle(
                                        color: Color(0x1ff1F5F3C),
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                child: isMobile(context) ? NavigatorCustom() : Container(),
              ),
            ],
          );
        },
      ),
    );
  }
}
