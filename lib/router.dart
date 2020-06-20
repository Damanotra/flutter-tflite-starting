import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite_demo/ui/screen/login/login.dart';
import 'test.dart';
import 'ui/screen/home/home.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_)=>(TfliteHome()),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_)=>HomeScreen(),
        );
        break;
      case '/test':
        return MaterialPageRoute(
          builder: (_)=>TfliteHome(),
        );
        break;
      default:
    }
  }
}