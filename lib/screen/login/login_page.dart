import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:routemaster/routemaster.dart';

import '../../utils/my_provider.dart';
import '../../utils/shared_object.dart';
import '../../widget/navigator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;
  late SharedObject sharedObject;

  final LocalStorage storage = LocalStorage('some_key');

  @override
  Widget build(BuildContext context) {
    setState(() {
      sharedObject = MyProvider.of(context);
    });
    return Scaffold(
      body: Container(
        // color: Colors.purple,
        child: ListView(
          children: [
            NavigatorCustom(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        onChanged: (value) {
                          username = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter username',
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter password',
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          login(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 30,
                            right: 30,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            // color: Colors.white,
                            border: Border.all(
                              color: Color(0x1ff1F5F3C),
                            ),
                            boxShadow: [],
                          ),
                          child: Text('login'.toUpperCase()),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login(BuildContext context) {
    print('username $username, password $password');
    if(username == 'thitiwas' && password == '1234') {
      sharedObject.profile.id = 1;
      sharedObject.profile.name = "Thitiwas Nupanz";
      sharedObject.profile.imageUrl = "https://static.independent.co.uk/s3fs-public/thumbnails/image/2015/06/06/15/Chris-Pratt.jpg?quality=75&width=982&height=726&auto=webp";
      sharedObject.profile.token = "1234";
      sharedObject.isLogin = true;
      // storage.setItem("profile", sharedObject.profile);
      storage.setItem("isLogin", true);
      storage.setItem("token", '1234');
      storage.setItem("name", sharedObject.profile.name);
      storage.setItem("imageUrl", sharedObject.profile.imageUrl);

      Routemaster.of(context).push('/profile');
    }
  }
}
