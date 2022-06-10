import 'package:flutter/material.dart';
import 'package:flutter_massage/utils/shared_object.dart';

class MyProvider extends InheritedWidget {
  final SharedObject sharedObject;

  MyProvider({required this.sharedObject, required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static SharedObject of(BuildContext context) {
    MyProvider? provider = context.dependOnInheritedWidgetOfExactType<MyProvider>();
    if (provider == null) {
      throw Exception('provider null');
    }
    return provider.sharedObject;
  }
}