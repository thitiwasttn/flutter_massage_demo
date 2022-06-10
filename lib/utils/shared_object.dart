import 'dart:math';

import '../model/profile.dart';

class SharedObject {



  Profile profile = Profile();

  late bool isLogin;

  SharedObject(){
    // print('isLogin >>> $isLogin');
  }
}