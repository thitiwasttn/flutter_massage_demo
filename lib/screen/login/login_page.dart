import 'package:flutter/material.dart';
import 'package:flutter_massage/service/profile_service.dart';
import 'package:localstorage/localstorage.dart';
import 'package:routemaster/routemaster.dart';

import '../../model/profile.dart';
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
  final ProfileService profileService = ProfileService();

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
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
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

  void _show(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (_) => AlertDialog(
          title: const Text('Invalid'),
          content: const Text('username or password'),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Close '))
          ],
        ));
  }

  Future<void> login(BuildContext context) async {
    print('username $username, password $password');
    Profile p = Profile();
    p = await profileService.login(username, password).then((value) {
      return value;
    });
    print('name ${p.name}');
    print('token ${p.token}');
    print('id ${p.id}');
    if (p.token != '') {
      sharedObject.profile.id = p.id;
      sharedObject.profile.name = p.name;
      sharedObject.profile.imageUrl = p.imageUrl;
      sharedObject.profile.token = p.token;
      sharedObject.isLogin = true;
      storage.setItem("isLogin", true);
      storage.setItem("token", p.token);
      storage.setItem("name", p.name);
      storage.setItem("id", p.id);
      storage.setItem("imageUrl", p.imageUrl);
      Routemaster.of(context).push('/profile');
    } else {
      _show(context);
    }
  }
}
