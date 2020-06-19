import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'test.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_)=>TfliteHome(),
        );
        break;
      default:
    }
  }
}