import 'app.dart';
import 'locator.dart';
import 'package:flutter/material.dart';

void main() {
  // await SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ],
  // );

  setupLocator();

  runApp(MyApp());
}


